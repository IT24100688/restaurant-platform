package com.restaurant.model;
import java.io.*;
import java.util.*;
import javax.servlet.ServletContext;


    public class AdminService {
        public static List<Admin> loadAdmins(ServletContext context) {
            List<Admin> admins = new ArrayList<>();
            String path = context.getRealPath("/data/AdminPasswords.txt");

            try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    if (parts.length == 2) {
                        admins.add(new Admin(parts[0], parts[1]));
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            return admins;
        }

        public static void saveAdmin(Admin admin, ServletContext context) {
            String path = context.getRealPath("/data/AdminPasswords.txt");
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, true))) {
                writer.write(admin.toFileFormat());
                writer.newLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public static void removeAdminByUsername(String username, ServletContext context) {
            List<Admin> all = loadAdmins(context);
            String path = context.getRealPath("/data/AdminPasswords.txt");

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
                for (Admin a : all) {
                    if (!a.getUsername().equalsIgnoreCase(username)) {
                        writer.write(a.toFileFormat());
                        writer.newLine();
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


