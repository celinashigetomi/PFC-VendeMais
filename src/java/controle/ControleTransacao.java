package controle;
import dao.AnuncioDAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Anuncio;
import modelo.Compra;
import modelo.Usuario;

public class ControleTransacao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals( request.getContextPath() + "/comprarAnuncio"  )) {
            try {
                comprar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);   
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals( request.getContextPath() + "/recuperarCompra"  )) {
            try {
                recuperar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);   
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (uri.equals( request.getContextPath() + "/selecionarAnuncio"  )) {
            try {
                selecionar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);   
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void comprar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
    
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String estado = request.getParameter("estado");
        Double peso = Double.parseDouble(request.getParameter("peso"));
        Double altura = Double.parseDouble(request.getParameter("altura"));
        Double largura = Double.parseDouble(request.getParameter("largura"));
        String categoria = request.getParameter("categoria");
        String subcategoria = request.getParameter("subcategoria");
        int id = Integer.parseInt(request.getParameter("idAnuncio"));
        int qtdDesejada = Integer.parseInt(request.getParameter("quantidadeDesejada"));
        
        Anuncio a = new Anuncio();
        a.setId(id);
        a.setTitulo(titulo);
        a.setDescricao(descricao);
        a.setQuantidade(quantidade);
        a.setPreco(preco);
        a.setEstado(estado);
        a.setPeso(peso);
        a.setAltura(altura);
        a.setLargura(largura);
        a.setCategoria(categoria);
        a.setSubcategoria(subcategoria);
        a.setVendedor(1);
        
        Compra c = new Compra();
        c.setAnuncio(a);
        c.setQuantidade(qtdDesejada);
        c.setTotal(a.getPreco()*c.getQuantidade());
        c.setData_compra(new Date(System.currentTimeMillis()));
        
        request.setAttribute("resultadoC",c);   
        request.setAttribute("resultadoA",a);  
        request.getRequestDispatcher("total.jsp").forward(request, response);
    }
    
    public void recuperar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
        
        Usuario u = new Usuario();
        u.setId(1);
        
        Anuncio a = new Anuncio();
        a.setVendedor(u.getId());
        AnuncioDAO edao = new AnuncioDAO();

        List<Anuncio> todosAnuncios = edao.consultar(a);
        
        request.setAttribute("resultado",todosAnuncios);
        request.getRequestDispatcher("compra.jsp").forward(request, response);
    }
    
    public void selecionar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{

        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String estado = request.getParameter("estado");
        Double peso = Double.parseDouble(request.getParameter("peso"));
        Double altura = Double.parseDouble(request.getParameter("altura"));
        Double largura = Double.parseDouble(request.getParameter("largura"));
        String categoria = request.getParameter("categoria");
        String subcategoria = request.getParameter("subcategoria");
        int id = Integer.parseInt(request.getParameter("idAnuncio"));
    
        Usuario u = new Usuario();
        u.setId(1);
        
        Anuncio a = new Anuncio();
        a.setId(id);
        a.setTitulo(titulo);
        a.setDescricao(descricao);
        a.setQuantidade(quantidade);
        a.setPreco(preco);
        a.setEstado(estado);
        a.setPeso(peso);
        a.setAltura(altura);
        a.setLargura(largura);
        a.setCategoria(categoria);
        a.setSubcategoria(subcategoria);
        a.setVendedor(u.getId());
                
        AnuncioDAO dao = new AnuncioDAO();
        
        dao.consultar(a);
        dao.alterar(a);
        request.setAttribute("resultado",a);            

        request.getRequestDispatcher("realizarCompra.jsp").forward(request, response);
    }    
}