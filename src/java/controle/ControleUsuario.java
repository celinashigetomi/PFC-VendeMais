package controle;
import dao.EnderecoDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Endereco;
import modelo.Usuario;

public class ControleUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String uri = request.getRequestURI();
        
        if (uri.equals( request.getContextPath() + "/consultarConta"  )) {   
            try {
                consultar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else  if (uri.equals( request.getContextPath() + "/excluir"  )) {
            try {
                excluir(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else  if (uri.equals( request.getContextPath() + "/recuperarConta"  )) {
            try {
                recuperar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String uri = request.getRequestURI();
        
        if (uri.equals( request.getContextPath() + "/cadastrarConta"  )) {
            try {
                cadastrar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else  if (uri.equals( request.getContextPath() + "/alterarConta"  )) {
            try {
                alterar(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (uri.equals( request.getContextPath() + "/login"  )) {   
            try {
                login(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroLogin.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
    
        Usuario u = new Usuario();
        u.setCpf(cpf);
        u.setEmail(email);
        u.setNome(nome);
        u.setSenha(senha);
        u.setTelefone(telefone);
    
        UsuarioDAO dao = new UsuarioDAO();
        dao.cadastrar(u);

        request.getRequestDispatcher("sucessoUsuario.html").forward(request, response);   
    }

    public void recuperar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{

        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        
        Usuario u = new Usuario();
        u.setId(1);
        u.setSenha(senha);
        u.setTelefone(telefone);
        
        UsuarioDAO dao = new UsuarioDAO();
        dao.consultar(u);
        dao.alterar(u);
        
        request.setAttribute("resultado",u);            
        request.getRequestDispatcher("alterarDadosConta.jsp").forward(request, response);
    }
    
    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{

        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        
        Usuario u = new Usuario();
        u.setId(1);
        u.setSenha(senha);
        u.setTelefone(telefone);
        
        UsuarioDAO dao = new UsuarioDAO();
        dao.alterar(u);
        
        request.setAttribute("resultado",u);            
        request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
    }

    public void excluir(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
        
        int iddelete = Integer.parseInt(request.getParameter("id"));

        Usuario p = new Usuario();
        p.setId(iddelete);
        
        UsuarioDAO dao = new UsuarioDAO();     
        dao.excluir(p);
        
        request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
    }

    public void consultar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
        
        //inserir comando para pegar o id de usuario automaticamente da pagina sem precisar atribuir set em usuario id
        
        Usuario u = new Usuario();
        u.setId(1);
        
        UsuarioDAO udao = new UsuarioDAO();
        udao.consultar(u);
        
        Endereco e = new Endereco();
        e.setUsuario(u.getId());
        
        EnderecoDAO edao = new EnderecoDAO();                
        List<Endereco> todosEnderecos = edao.consultar(e);

        request.setAttribute("resultado",u);
        request.setAttribute("resultadoE",todosEnderecos);
        request.getRequestDispatcher("consultaDados.jsp").forward(request, response);
    }
    
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
        
        String login = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setEmail(login);
        usuario.setSenha(senha);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioAutenticado = usuarioDAO.validar(usuario);

        HttpSession sessaoUsuario = request.getSession();
        
        if (usuarioAutenticado !=null){
            sessaoUsuario.setAttribute("usuario",usuarioAutenticado);
            sessaoUsuario.setMaxInactiveInterval(10);
            request.getRequestDispatcher("home.html").forward(request, response);
        }else{
            sessaoUsuario.invalidate();
            response.sendRedirect("erroLogin.html");
        }
    }
    
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
        
        HttpSession sessaoUsuario = request.getSession();
        sessaoUsuario.invalidate();
        response.sendRedirect("index.html");
    
    }
    
}