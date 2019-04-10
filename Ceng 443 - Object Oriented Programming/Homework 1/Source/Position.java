import java.util.Random;

/**
 * This is the class where Positions and Directions calculations of Simulation Objects provided.
 * In addition there are couple function that I insert to this class.
 * It contains double x and y which are coordinate of the Simulation object in the field.
 *
 */
public class Position {
    private double x;
    private double y;
    
    private double length;

    /**
     * This is the main constructor of the Position class.
     * @param x horizontal position in the field.
     * @param y vertical position in the field.
     */
    public Position(double x, double y) {
        this.x = x;
        this.y = y;
        this.calculateLength();
    }

    /**
     * Getter of the x position.
     * @return x position.
     */
    public double getX() {
        return x;
    }

    /**
     * Getter of the y position.
     * @return y position.
     */
    public double getY() {
        return y;
    }

    /**
     * Checks if the position is inside of the simulation field
     *
     * @param x Horizontal coordinate of the object.
     * @param y Vertical coordinate of the object.
     * @return If object is inside of the field, return true. Otherwise false.
     */
    public boolean checkBorders(double x, double y){
        return this.getX() > 0 && this.getY() > 0 && this.getX() < x && this.getY() < y;
    }

    /**
     * Calculates distance of two different Position.
     * @param other is opposite position that we want distance from it.
     * @return distance between current position and other position.
     */
    public double distance(Position other) {
        return Math.sqrt(Math.pow(this.x-other.getX(), 2)+Math.pow(this.y-other.getY(), 2));
    }

    /**
     * Adds two Position and saves it into current Position.
     * @param other is the position that we want to add.
     */
    public void add(Position other) {
        this.x += other.x;
        this.y += other.y;
        
        this.calculateLength();
    }

    /**
     * Multiply Position with constant and saves it into current Position.
     * @param constant is the double constant that we want to multiply with Position.
     */
    private void mult(double constant) {
        this.x *= constant;
        this.y *= constant;
        
        this.calculateLength();
    }

    /**
     * This is the function i added to this class.
     * It does same functionality with "add" function. Difference is only it returns a new position.
     * @param position is the position that we want to add.
     * @return new position.
     */
    Position addWithReturn(Position position) {
        Position newPosition = new Position(x,y);
        newPosition.add(position);
        return newPosition;
    }

    /**
     * This is the function i added to this class.
     * It does same functionality with "mult" function. Difference is only it returns a new position.
     * @param speed is the constant that we want to multiply with current position.
     * @return new position.
     */
    Position multWithReturn(double speed) {
        Position position = new Position(x,y);
        position.mult(speed);
        return position;
    }

    /**
     * Calculates the distance of the position with (0,0) point.
     */
    private void calculateLength() {
        this.length = Math.sqrt(Math.pow(x, 2.0)+Math.pow(y, 2.0));
    }

    /**
     * Normalizes the position
     */
    void normalize() {
        this.x /= this.length;
        this.y /= this.length;
        
        this.length = 1.0;
    }

    /**
     * This is the function that generates random Position.
     * It is capable of normalizing the new generated position.
     * Normalizing makes it in the form of Direction of Simulation Object.
     * @param normalize is the boolean that decides to normalize the new generated Position.
     * @return new Position.
     */
    public static Position generateRandomDirection(boolean normalize) {
        Random random = new Random();
        double x = -1+random.nextDouble()*2;
        double y = -1+random.nextDouble()*2;
        
        Position result = new Position(x, y);
        if (normalize)
            result.normalize();
        return result;
    }

    /**
     * Clones the current Position.
     * @return new Position.
     */
    @Override
    protected Object clone() {
        return new Position(x, y);
    }

    /**
     * Comparison of two Position is done here.
     * @param obj is compared object
     * @return if equal, return true. Otherwise false.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Position other = (Position) obj;
        if (this.x != other.x) {
            return false;
        }
        return this.y == other.y;
    }

    /**
     * Generates hash of the Position.
     * @return hash of the position
     */
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 59 * hash + (int) (Double.doubleToLongBits(this.x) ^ (Double.doubleToLongBits(this.x) >>> 32));
        hash = 59 * hash + (int) (Double.doubleToLongBits(this.y) ^ (Double.doubleToLongBits(this.y) >>> 32));
        return hash;
    }

    /**
     * Stringify the Position object with a format of (x,y).
     * @return string format of the Position.
     */
    @Override
    public String toString() {
        return String.format("(%.2f, %.2f)", x, y);
    }
    
}
