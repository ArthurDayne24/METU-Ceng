import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.concurrent.Semaphore;

public class Simulator {
    public static volatile Controller controller;
    public static ArrayList<Semaphore> smelterSemaphores;
    public static ArrayList<Semaphore> constructorSemaphores;

    public static void main(String[] argv){


        controller = new Controller();

        HW2Logger.InitWriteOutput();

        initializeSemaphores();

        initialize(controller);
        runAllThreads();


    }

    private static void initialize(Controller controller){
        BufferedReader br;
        try {
            br = new BufferedReader(new InputStreamReader(System.in));
//            br = new BufferedReader(new InputStreamReader(System.in));

            String st;
            st = br.readLine();
            int size;
            int[] res;
            size = Integer.parseInt(st);

            for(int i = 0; i < size;i++){
                st = br.readLine();
                res = parse(st);
                controller.getSmelters().add(new Smelter(i+1,res[0],res[1],res[3]));
                smelterSemaphores.add(new Semaphore(1));

            }

            st = br.readLine();
            size = Integer.parseInt(st);

            for(int i = 0; i < size;i++){
                st = br.readLine();
                res = parse(st);
                controller.getConstructors().add(new Constructor(i+1,res[0],res[1],res[2]));
                constructorSemaphores.add(new Semaphore(1));
            }

            st = br.readLine();
            size = Integer.parseInt(st);

            for(int i = 0; i < size;i++){
                st = br.readLine();
                res = parse(st);
                controller.getTransporter().add(new Transporter(i+1,res[0],res[1],res[2]));

            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private static int[] parse(String line){
        int[] integers = new int[4];
        String[] s = line.split(" ");
        for (int i = 0; i<s.length; i++) {
            integers[i] = Integer.parseInt(s[i]);
        }
        return integers;
    }

    private static void runAllThreads(){
        try {
            for (int i= 0; i < controller.getSmelters().size(); i++)
                controller.getSmelters().get(i).start();
            for (int j= 0; j < controller.getConstructors().size(); j++)
                controller.getConstructors().get(j).start();
            for (int k= 0; k < controller.getTransporter().size(); k++)
                controller.getTransporter().get(k).start();
            for (int i= 0; i < controller.getSmelters().size(); i++)
                    controller.getSmelters().get(i).join();
            for (int j= 0; j < controller.getConstructors().size(); j++)
                controller.getConstructors().get(j).join();
            for (int k= 0; k < controller.getTransporter().size(); k++)
                controller.getTransporter().get(k).join();

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private static void initializeSemaphores(){
        smelterSemaphores = new ArrayList<>();
        constructorSemaphores = new ArrayList<>();
    }




}

