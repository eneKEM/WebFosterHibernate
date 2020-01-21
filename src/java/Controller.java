/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import pojos.Categoria;
import pojos.Producto;
import util.HibernateUtil;

/**
 *
 * @author Eneko
 */
@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     */
    private static final long serialVersionUID = 1L;
    private ArrayList<Categoria> categorias;
    private Categoria categoria;
    private boolean showC=true;
    private ArrayList<Producto> productos;
    private Producto producto;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        HttpSession session = request.getSession();
        String op = request.getParameter("op");
        RequestDispatcher dispatcher;
        Session singelton = HibernateUtil.getSessionFactory().openSession();
        Query q = singelton.createQuery("from Categoria");
        Iterator ita= q.iterate();
        for (;ita.hasNext();){
            categorias.add((Categoria)ita.next());
            
        }

        if (op.equals("inicio")) {
                
                session.setAttribute("categorias", categorias);
                session.setAttribute("showC", true);
                session.setAttribute("showP", false);
                System.out.println(categorias);
                dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
        } else if (op.equals("dameproductos")) {
              
                int categoria = Integer.parseInt(request.getParameter("categoria"));
                Set lista=categorias.get(categoria).getProductos();
                for (Iterator itt = lista.iterator();itt.hasNext();){
                  Producto mit=(Producto) itt.next();
                      productos.add(mit);
                    }

                System.out.println(categoria);
                session.setAttribute("showC", false);
                session.setAttribute("showP", true);
                session.setAttribute("productos", productos);
                dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
                
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
