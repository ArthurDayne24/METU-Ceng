package GameEngine.Scorboard;


import com.google.common.base.Objects;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Embeddable
public class ScoreboardIdentity implements Serializable {



    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @Column(name ="date")
    private Date date;

    @Override
    public boolean equals(Object o){
        if (this == o) return true;
        if ( !(o instanceof ScoreboardIdentity) ) return false;

        ScoreboardIdentity that = (ScoreboardIdentity) o;

        return Objects.equal(getDate(),that.getDate()) && Objects.equal(getName(),that.getName());
    }

    @Override
    public int hashCode(){
        return getName().hashCode() + getDate().hashCode();
    }

    public ScoreboardIdentity() {

    }

    public ScoreboardIdentity(String name, Date date) {
        this.name = name;
        this.date = date;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
