#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "ext2.h"

#define BASE_OFFSET 1024
#define EXT2_BLOCK_SIZE 1024
#define IMAGE "image.img"

typedef unsigned char bmap;
#define __NBITS (8 * (int) sizeof (bmap))
#define __BMELT(d) ((d) / __NBITS)
#define __BMMASK(d) ((bmap) 1 << ((d) % __NBITS))
#define BM_SET(d, set) ((set[__BMELT (d)] |= __BMMASK (d)))
#define BM_CLR(d, set) ((set[__BMELT (d)] &= ~__BMMASK (d)))
#define BM_ISSET(d, set) ((set[__BMELT (d)] & __BMMASK (d)) != 0)

unsigned int block_size = 0;
#define BLOCK_OFFSET(block) (BASE_OFFSET + (block-1)*block_size)

void set_function(bmap *bitmap, struct ext2_inode inode, int fd){
    unsigned int* block = malloc(block_size), *block2 = malloc(block_size),*block3 = malloc(block_size);
    for (int i = 0; i < 15; ++i)
    {
        if (inode.i_block[i] !=0)
        {
            BM_SET(inode.i_block[i],bitmap);
            if (i == 12)
            {
                lseek(fd, BLOCK_OFFSET(inode.i_block[i]), SEEK_SET);
                read(fd, block, block_size);
                for (int j = 0; j < block_size/sizeof(unsigned int); ++j)
                {
                    (BM_SET(block[j]-1,bitmap));
                }
            }
            if (i == 13)
            {
                lseek(fd, BLOCK_OFFSET(inode.i_block[i]), SEEK_SET);
                read(fd, block, block_size);
                for (int j = 0; j < block_size/sizeof(unsigned int); ++j)
                {
                    BM_ISSET(block[j]-1,bitmap);
                    
                    lseek(fd, BLOCK_OFFSET(block[j]), SEEK_SET);
                    read(fd, block2, block_size);
                    for (int k = 0; k < block_size/sizeof(unsigned int); ++k)
                    {
                        (BM_ISSET(block[j]-1,bitmap));    
                    }
                }
            }
            if (i == 14)
            {
                lseek(fd, BLOCK_OFFSET(inode.i_block[i]), SEEK_SET);
                read(fd, block, block_size);
                for (int j = 0; j < block_size/sizeof(unsigned int); ++j)
                {
                    BM_ISSET(block[j]-1,bitmap);
                    
                    lseek(fd, BLOCK_OFFSET(block[j]), SEEK_SET);
                    read(fd, block2, block_size);
                    for (int k = 0; k < block_size/sizeof(unsigned int); ++k)
                    {
                        BM_ISSET(block2[j]-1,bitmap);

                        lseek(fd, block_size*block2[k], SEEK_SET);
                        read(fd, block3, block_size);
                        for (int z = 0; z < block_size/sizeof(unsigned int) ; ++z)
                        {
                            BM_ISSET(block[3],bitmap);

                        }
                    }
                }
            }
        }
    }
}


int is_set_block(bmap *bitmap, struct ext2_inode inode, int fd){
    unsigned int* block = malloc(block_size), *block2 = malloc(block_size),*block3 = malloc(block_size);
    for (int i = 0; i < 15; ++i)
    {
        if(inode.i_block[i] == 0)
            break;
        if(BM_ISSET(inode.i_block[i],bitmap)){
            return 0;
        }
        if (i == 12)
        {
            lseek(fd, BLOCK_OFFSET(inode.i_block[i]), SEEK_SET);
            read(fd, block, block_size);
            for (int j = 0; j < block_size/sizeof(unsigned int); ++j)
            {
                if (block[j] == 0)
                    break;
                if (BM_ISSET(block[j]-1,bitmap))
                    return 0;
            }
        }
        if (i == 13)
        {
            lseek(fd, BLOCK_OFFSET(inode.i_block[i]), SEEK_SET);
            read(fd, block, block_size);
            for (int j = 0; j < block_size/sizeof(unsigned int); ++j)
            {
                if (block[j] == 0)
                    break;
                if (BM_ISSET(block[j]-1,bitmap))
                    return 0;
                
                lseek(fd, BLOCK_OFFSET(block[j]), SEEK_SET);
                read(fd, block2, block_size);
                for (int k = 0; k < block_size/sizeof(unsigned int); ++k)
                {
                    if (block[j] == 0)
                        break;
                    if (BM_ISSET(block[j]-1,bitmap))
                        return 0;    
                }
            }
        }
        if (i == 14)
        {
            lseek(fd, BLOCK_OFFSET(inode.i_block[i]), SEEK_SET);
            read(fd, block, block_size);
            for (int j = 0; j < block_size/sizeof(unsigned int); ++j)
            {
                if (block[j] == 0)
                    break;
                if (BM_ISSET(block[j]-1,bitmap))
                    return 0;
                
                lseek(fd, BLOCK_OFFSET(block[j]), SEEK_SET);
                read(fd, block2, block_size);
                for (int k = 0; k < block_size/sizeof(unsigned int); ++k)
                {
                    if (block2[j] == 0)
                        break;
                    if (BM_ISSET(block2[j]-1,bitmap))
                        return 0;
                    lseek(fd, block_size*block2[k], SEEK_SET);
                    read(fd, block3, block_size);
                    for (int z = 0; z < block_size/sizeof(unsigned int) ; ++z)
                    {
                        if (block3[z] == 0)
                            break;
                        if (BM_ISSET(block[3],bitmap))
                            return 0;

                    }
                }
            }
        }
        

    }
    return 1;
}
int main(void)
{
    struct ext2_super_block super;
    struct ext2_group_desc group;
    int fd,icnt;
    struct ext2_inode inode;

    if ((fd = open(IMAGE, O_RDWR)) < 0) {
        perror(IMAGE);
        exit(1);
    }
                                               // READ SUPER-BLOCK
    lseek(fd, BASE_OFFSET, SEEK_SET);
    read(fd, &super, sizeof(super));
    if (super.s_magic != EXT2_SUPER_MAGIC) {
        fprintf(stderr, "Not a Ext2 filesystem\n");
        exit(1);
    }
    block_size = 1024 << super.s_log_block_size;
                                                // READ GROUP DESCRIPTOR

    lseek(fd, BASE_OFFSET + block_size, SEEK_SET);
    read(fd, &group, sizeof(group));
                                                // READ I-NODE BITMAP
    
    bmap *inode_bitmap;
    inode_bitmap = malloc(block_size);
    lseek(fd, BLOCK_OFFSET(group.bg_inode_bitmap),SEEK_SET);
    read(fd,inode_bitmap,block_size);
    

    int fr = 0;
    int nfr = 0;

    for (int i = 0; i < super.s_inodes_per_group; i++){
        if (BM_ISSET(i,inode_bitmap)){
            nfr++;
        }
        else{
            fr++;
        }
    }
                                            // FIND DELETED I-NODES
    unsigned int inodes[fr];
    unsigned int count = 0;
    for (int i = super.s_first_ino+1; i < super.s_inodes_per_group; ++i)
    {
        lseek(fd,BLOCK_OFFSET(group.bg_inode_table)+i*sizeof(struct ext2_inode),SEEK_SET);
        read(fd,&inode,block_size);
        if(inode.i_size != 0 && !BM_ISSET(i,inode_bitmap)){
            inodes[count] = i;
            count++;
        }
    }

                                                //PRINT POSSIBLE I-NODES
    unsigned int deletion_times[count];
    unsigned int inode_block_numbers[count];
    unsigned int file_name_indexes[count];


    for (int i = 0; i < count; ++i)
    {
        lseek(fd,BLOCK_OFFSET(group.bg_inode_table)+inodes[i]*sizeof(struct ext2_inode),SEEK_SET);
        read(fd,&inode,block_size);
        deletion_times[i] = inode.i_dtime;
        file_name_indexes[i] = i+1; 
        inode_block_numbers[i] = (inode.i_blocks*512)/1024;
        if (i< 9){
            printf("file0%d %u %u\n", file_name_indexes[i],deletion_times[i],inode_block_numbers[i]);
        }
        else{
            printf("file%d %u %u\n", file_name_indexes[i],deletion_times[i],inode_block_numbers[i]);
        }
    }

    printf("###\n");
                                                // SORT DELETED TIME
    unsigned int temp_dtime;
    unsigned int temp_block_number;
    unsigned int temp_inode_index;
    unsigned int temp_file_names;
    for (int i = 0; i < count; ++i)
    {
        for (int j = 0; j < count; ++j)
        {
            if (i != j)
            {
                if (deletion_times[i] > deletion_times[j])
                {
                    temp_dtime = deletion_times[i];
                    deletion_times[i] = deletion_times[j];
                    deletion_times[j] = temp_dtime;

                    temp_inode_index = inodes[i];
                    inodes[i] = inodes[j];
                    inodes[j] = temp_inode_index;

                    temp_block_number = inode_block_numbers[i];
                    inode_block_numbers[i] = inode_block_numbers[j];
                    inode_block_numbers[j] = temp_block_number;

                    temp_file_names = file_name_indexes[i];
                    file_name_indexes[i] = file_name_indexes[j];
                    file_name_indexes[j] = temp_file_names;
                }
            }
            
        }
    }

    bmap *block_bitmap;
    block_bitmap = (bmap*)malloc(block_size);
    lseek(fd, BLOCK_OFFSET(group.bg_block_bitmap), SEEK_SET);
    read(fd, block_bitmap, block_size);

    int size= 0;
    unsigned int last_standing[size+1];
    for (int i = 0; i < count; ++i)
    { 
        lseek(fd,BLOCK_OFFSET(group.bg_inode_table)+(inodes[i])*sizeof(struct ext2_inode),SEEK_SET);
        read(fd,&inode,block_size);
        if(is_set_block(block_bitmap, inode, fd) == 1){
            last_standing[size] = i;
            set_function(block_bitmap, inode, fd);
            BM_SET(inodes[i],inode_bitmap);
            BM_SET(inodes[i],block_bitmap);  
            size++;
        }

    }
    lseek(fd, BLOCK_OFFSET(group.bg_inode_bitmap), SEEK_SET);
    write(fd, inode_bitmap, block_size);

    lseek(fd, BLOCK_OFFSET(group.bg_block_bitmap), SEEK_SET);
    write(fd, block_bitmap, block_size);
    lseek(fd, BASE_OFFSET, SEEK_SET);
    read(fd, &super, sizeof(super));
  
    unsigned int new_inodes[size];
    unsigned int new_deletion_times[size];
    unsigned int new_inode_block_numbers[size];
    unsigned int new_file_name_indexes[size];

    for (int i = 0; i < size; ++i)
    {
        new_inodes[i] = inodes[last_standing[i]];
        new_deletion_times[i] = deletion_times[last_standing[i]];
        new_file_name_indexes[i] = file_name_indexes[last_standing[i]];
        new_inode_block_numbers[i] = inode_block_numbers[last_standing[i]];
    }
    
    for (int i = 0; i < size; ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            if (i != j)
            {
                if (new_file_name_indexes[i] < new_file_name_indexes[j])
                {
                    temp_dtime = new_deletion_times[i];
                    new_deletion_times[i] = new_deletion_times[j];
                    new_deletion_times[j] = temp_dtime;

                    temp_inode_index = new_inodes[i];
                    new_inodes[i] = new_inodes[j];
                    new_inodes[j] = temp_inode_index;

                    temp_block_number = new_inode_block_numbers[i];
                    new_inode_block_numbers[i] = new_inode_block_numbers[j];
                    new_inode_block_numbers[j] = temp_block_number;

                    temp_file_names = new_file_name_indexes[i];
                    new_file_name_indexes[i] = new_file_name_indexes[j];
                    new_file_name_indexes[j] = temp_file_names;
                }
            }
            
        }
    }

    int i;
    for (i = 0; i < 62; ++i)
    {
        if(i == size)
            break;
        struct ext2_dir_entry topcu_entry;
        topcu_entry.inode = new_inodes[i]+1;
        topcu_entry.name_len = 6;
        topcu_entry.file_type = 1;
        if (file_name_indexes[i]> 9)
        {   

            sprintf(topcu_entry.name,"file%d",new_file_name_indexes[i]);
        }
        else{
            sprintf(topcu_entry.name,"file0%d",new_file_name_indexes[i]);
            printf("%s\n",topcu_entry.name);
            
        }
        lseek(fd, BLOCK_OFFSET(group.bg_inode_table)+(new_inodes[i])*sizeof(struct ext2_inode), SEEK_SET);
        read(fd, &inode, sizeof(struct ext2_inode));
        inode.i_mode = EXT2_S_IFREG | EXT2_S_IRUSR;
        lseek(fd, BLOCK_OFFSET(group.bg_inode_table)+(new_inodes[i])*sizeof(struct ext2_inode), SEEK_SET);
        write(fd, &inode, sizeof(struct ext2_inode));
        struct ext2_dir_entry temp_entry;
        lseek(fd, BLOCK_OFFSET(group.bg_inode_table)+10*sizeof(struct ext2_inode), SEEK_SET);
        read(fd, &inode, sizeof(struct ext2_inode));
        
        if(i == 0){
            lseek(fd,BLOCK_OFFSET(inode.i_block[0])+12,SEEK_SET);
            read(fd,&temp_entry,12);
            temp_entry.rec_len = 12;
            lseek(fd,BLOCK_OFFSET(inode.i_block[0])+12,SEEK_SET);
            write(fd,&temp_entry,12);
            lseek(fd,BLOCK_OFFSET(inode.i_block[0])+24,SEEK_SET);
            topcu_entry.rec_len = block_size-24;
            write(fd,&topcu_entry,topcu_entry.rec_len);
        }
        else{
            lseek(fd,BLOCK_OFFSET(inode.i_block[0])+24+16*(i-1),SEEK_SET);
            read(fd,&temp_entry,16);
            temp_entry.rec_len = 16;
            lseek(fd,BLOCK_OFFSET(inode.i_block[0])+24+16*(i-1),SEEK_SET);
            write(fd,&temp_entry,16);
            lseek(fd,BLOCK_OFFSET(inode.i_block[0])+24+16*i,SEEK_SET);
            topcu_entry.rec_len = block_size-24-16*i;
            write(fd,&topcu_entry,topcu_entry.rec_len);
        }
    }

    free(inode_bitmap);
    free(block_bitmap);
    close(fd);
    return 0;
}

