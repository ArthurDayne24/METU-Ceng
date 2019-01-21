#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
#include <vector>
#include <stdio.h>

using namespace std;

int minDistance(int dist[], bool sptSet[], int number_of_vertices)
{
   
   int min = 100 * number_of_vertices, min_index;
  
   for (int v = 0; v < number_of_vertices; v++)
     if (sptSet[v] == false && dist[v] <= min)
         {min = dist[v];
         min_index = v;
  }
   return min_index;
}
  

int printSolution(int dist[], int n)
{
   printf("Vertex   Distance from Source\n");
   for (int i = 0; i < n; i++)
      printf("%d  --- %d\n", i, dist[i]);
}
  

int* dijkstra(vector<vector<int> > graph, int src, vector<int> Dest_indexs, int number_of_vertices,int *dist)
{
     
    bool sptSet[number_of_vertices]; 
    for (int i = 0; i < number_of_vertices; i++){
        sptSet[i] = false;
  }
    dist[src] = 0;
    
    for (int count = 0; count < number_of_vertices - 1; count++)
    {
      
    int u = minDistance(dist, sptSet, number_of_vertices);

    sptSet[u] = true;
  
       
    for (int v = 0; v < number_of_vertices; v++)
  
         
        if (!sptSet[v] && graph[u][v] && dist[u] != 100 * number_of_vertices	
                                       && dist[u]+graph[u][v] < dist[v])
            dist[v] = dist[u] + graph[u][v];
    }

     
    printSolution(dist, number_of_vertices);
    return dist;
}


int check_sum(vector<vector<int> > result, int src, vector<int>  Dest_indexs, vector<int> dist_1, vector<int> dist_2, int flag){
	int sum = 0;
	int min_index =0;
	int min = 0; 
	vector<int> sptSet;
	for (int i = 0; i < Dest_indexs.size(); i++)
    	sptSet.push_back(0);

   cout << "BOOL INITIALIZATION COMPLETED! " << endl;
    for(int i = 0; i < Dest_indexs.size();i++){
			cout << result[i][0] << endl;
			if(result[i][0] == src  && sptSet[i] != 1 && dist_2[Dest_indexs[i]] < min){
				cout << "here" << endl;
				min = dist_2[Dest_indexs[i]];
				min_index = i;
			}	
		}
	return 1;
}
void first_to_second(int number_of_vertices, vector<vector<int> > result, vector<int> dist_1  , vector<int> dist_2 , int src1, int src2, vector<int> Dest_indexs, int c1, int c2){
	int min = dist_1.size() * 100;
	int min_index = 0;
	int sum = 0;
	vector<int>  sptSet; 
     
    for (int i = 0; i < Dest_indexs.size(); i++)
        sptSet.push_back(0);
  	cout << "hELOO MAFALKS" << endl;
	while(c1 > c2){
		for(int i = 0; i < Dest_indexs.size();i++){
			cout << result[i][0] << endl;
			if(result[i][0] == src1  && sptSet[i] != 1 && dist_2[Dest_indexs[i]] < min){
				cout << "here" << endl;
				min = dist_2[Dest_indexs[i]];
				min_index = i;
			}
		}
		cout << min_index << " - " << endl;
		result[min_index][0] = src2;
		result[min_index][2] = min;
		sptSet[min_index] = 1;
		for (int i = 0; i < 4; ++i)
		{
			cout << " -- " << sptSet[i];
		}
		cout << endl;
		cout << "dest ->" << Dest_indexs[min_index] << "    weight ->" << result[min_index][2] << endl;
		c1--;
		c2++;
		min = 100 * number_of_vertices;
		cout << "1.source number -> " << c1 << "    and 2.source number -> " << c2 << endl;
	}

	for (int i = 0; i < Dest_indexs.size(); ++i)
		{
			sum += result[i][2];
		}
		cout << sum << endl;
		for (int i = 0; i < Dest_indexs.size(); ++i)
		{
			cout << result[i][1] << " " << result[i][0] << endl;
		}
}

void second_to_first(int number_of_vertices, vector<vector<int> > result, vector<int>  dist_1, vector<int> dist_2, int src1, int src2, vector<int> Dest_indexs, int c1, int c2){
	int min = 100 * dist_1.size();
	int min_index = 0;
	int sum = 0;
	vector<int>  sptSet; 
    
    for (int i = 0; i < Dest_indexs.size(); i++)
        sptSet.push_back(0);
  	cout << "hELOO MAFALKS 2 " << endl;
	while(c1 < c2){
		for(int i = 0; i < Dest_indexs.size();i++){
			cout << result[i][0] << endl;
			if(result[i][0] == src2  && sptSet[i] != 1 && dist_1[Dest_indexs[i]] < min){
				cout << "here" << endl;
				min = dist_1[Dest_indexs[i]];
				min_index = i;
			}
		}
		cout << min_index << " - " << endl;
		result[min_index][0] = src1;
		result[min_index][2] = min;
		sptSet[min_index] = 1;
		for (int i = 0; i < 4; ++i)
		{
			cout << " -- " << sptSet[i];
		}
		cout << endl;
		cout << "dest ->" << Dest_indexs[min_index] << "    weight ->" << result[min_index][2] << endl;
		c1++;
		c2--;
		min = 100 * number_of_vertices;
		cout << "1.source number -> " << c1 << "    and 2.source number -> " << c2 << endl;
	}

	for (int i = 0; i < Dest_indexs.size(); ++i)
		{
			sum += result[i][2];
		}
		cout << sum << endl;
		for (int i = 0; i < Dest_indexs.size(); ++i)
		{
			cout << result[i][1] << " " << result[i][0] << endl;
		}
}

void find(vector<int> dist_1, vector<int> dist_2, vector<int> Dest_indexs,int src1,int src2){
	for (int j = 0; j < dist_1.size(); ++j)
	{
		cout << dist_1[j] << " / ";
	}
	cout << endl;

	for (int j = 0; j < dist_1.size(); ++j)
	{
		cout << dist_2[j] << " / ";
	}
	cout << endl;
	cout << endl;

	vector<vector<int> > result;
	vector<int> temp;
	for (int i = 0; i < Dest_indexs.size(); ++i)
	{
		result.push_back(temp);
	}
	int count_of_src1= 0;
	int count_of_src2= 0;
	vector<int> v;
	for (int i = 0; i < Dest_indexs.size() ; ++i)
	{
		cout << i+1 << ". Destination =" << Dest_indexs[i] << endl;
		cout << "1. source ->" << dist_1[Dest_indexs[i]] << endl;
		cout << "2. source ->" << dist_2[Dest_indexs[i]] << endl;
		cout << endl;
		if (dist_1[Dest_indexs[i]] < dist_2[Dest_indexs[i]])
		{
			result[i].push_back(src1);
			result[i].push_back(Dest_indexs[i]);
			result[i].push_back(dist_1[Dest_indexs[i]]);
			count_of_src1++;
		}
		else{
			result[i].push_back(src2);
			result[i].push_back(Dest_indexs[i]);
			result[i].push_back(dist_2[Dest_indexs[i]]);
			count_of_src2++;
		}
	}
	cout << endl;
	cout << "AND THE RESULT IS .... " << endl;
	cout << endl;
	int sum_onn = 0;

	for (int i = 0; i < Dest_indexs.size(); ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cout << result[i][j] << " -- ";
			if(j== 2)
				sum_onn += result[i][j]; 
		}
		cout << endl;
		//cout << sum_onn << endl;
	}
	cout << "1.source number -> " << count_of_src1 << "    and 2.source number -> " << count_of_src2 << endl;
	int sum = 0;
	if (count_of_src1 == count_of_src2)
	{
		for (int i = 0; i < Dest_indexs.size(); ++i)
		{
			sum += result[i][2];
		}
		cout << sum << endl;
		for (int i = 0; i < Dest_indexs.size(); ++i)
		{
			cout << result[i][1] << " " << result[i][0] << endl;
		}
	}
	/*else if (count_of_src1 > count_of_src2){
		cout << "im here" << endl;
		first_to_second(dist_1.size(), result, dist_1, dist_2, src1, src2, Dest_indexs, count_of_src1, count_of_src2);
	}
	else
		second_to_first(dist_1.size(), result, dist_1, dist_2, src1 ,src2 , Dest_indexs, count_of_src1, count_of_src2);
*/}
void dijkstra_helper(vector<vector<int> > graph, int src1, int src2, vector<int> Dest_indexs, int number_of_vertices){
	int dist[number_of_vertices];
	for (int i = 0; i < number_of_vertices; ++i)
	{
		dist[i] = 100 * number_of_vertices;
	}
	int *v= dijkstra(graph, src1, Dest_indexs,number_of_vertices,dist);
	cout << "SECOND Warehouse : " << src2 << endl;
	
	vector<int> dist_1;
	for (int i = 0; i < number_of_vertices; ++i)
	{
		dist_1.push_back(v[i]);
	}
	for (int i = 0; i < number_of_vertices; ++i)
	{
		dist[i] = 100 * number_of_vertices;
	}
	vector<int> dist_2;
	int *c = dijkstra(graph, src2, Dest_indexs, number_of_vertices,dist);
	for(int i = 0; i < number_of_vertices; ++i)
	{
		dist_2.push_back(c[i]);
	}
	cout << "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_" << endl;
	cout << endl;

	find(dist_1, dist_2, Dest_indexs,src1,src2);
}

int main(int argc, char const *argv[])
{
	int number_of_vertices,i,j,temp;
	ifstream infile;
	infile.open(argv[1]);
	string s;
	vector<int> Dest_indexs;
	vector<vector<int> > Weights;
	vector<int> temp_vector;
	infile >> s;
	number_of_vertices = atoi(s.c_str());
	cout << "Number of Vertices : " << number_of_vertices << endl;
	for (i = 0; i < number_of_vertices; i++)
	{
		Weights.push_back(temp_vector);
	}
	infile >> s;
	int number_of_dest = atoi(s.c_str());
	cout << "Number of Dest     : " << number_of_dest << endl;
	infile >> s;
	int warehouse_1 = atoi(s.c_str());
	infile >> s;
	int warehouse_2 = atoi(s.c_str());
	cout << "WH-1 : " << warehouse_1 << endl;
	cout << "WH-2 : " << warehouse_2 << endl;
	for (i = 0; i < number_of_dest; ++i)
	{
		infile >> s;
		temp = atoi(s.c_str());
		Dest_indexs.push_back(temp);
	}
	cout << "Destinations       : ";																																																																																																																																																															
	for (	i = 0; i < Dest_indexs.size(); ++i)
	{			
		if (i == Dest_indexs.size() - 1)
			cout << Dest_indexs[i];
		else
			cout << Dest_indexs[i] << " - ";
	}
	cout << endl;
	cout << endl;
	cout << "            WEIGHTS" << endl;
	cout << "--------------------------------" << endl; 
	cout << endl;
	for (i = 0; i < number_of_vertices; i++)
	{
		for (j = 0; j < number_of_vertices; j++)
		{
			infile >> s;
			temp = atoi(s.c_str());
			Weights[i].push_back(temp);
			if(j != number_of_vertices-1)
				cout << Weights[i][j] << " - ";
			else
				cout << Weights[i][j] << endl;
		}
		cout << endl;
	}
	infile.close();
	cout << "FIRST Warehouse : " << warehouse_1 << endl;
	dijkstra_helper(Weights, warehouse_1, warehouse_2, Dest_indexs,number_of_vertices);
	cout << endl;
	return 0;
}