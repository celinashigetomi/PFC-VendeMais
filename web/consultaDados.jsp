<%@page import="java.util.List"%>
<%@page import="modelo.Endereco"%>
<%@page import="modelo.Usuario"%>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="img/i.ico" >

    <title>DADOS DA CONTA</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

	<SCRIPT src="js/jquery-1.5.2.min.js"></SCRIPT>
	<SCRIPT src="js/jquery.maskedinput-1.3.min.js"></SCRIPT>
			
</head>

<body>
    <div class="brand">Vende+</div>
    <div class="address-bar">Aqui você vende muito mais!</div>

    <!-- Navigation -->
    <div class="container" align="center">
        <div class="box" style="width: 80%;"  align="center" >
            <hr>
                <h2 class="intro-text text-center">Dados da Conta</h2>
            <hr>
            
            <table >
                <tbody>
                    <%
                        Usuario usuario = (Usuario) request.getAttribute("resultado");
                        if(usuario!=null){
                    %>
                    <tr>
                        <td width=20%><label for="nome">Nome: </label></td>
                        <td><%=usuario.getNome()%></td>
                    </tr>
                    <tr>
                        <td><label for="telefone">Telefone: </label></td>
                        <td><%=usuario.getTelefone()%></td>
                    </tr>
                    <tr>
                        <td><label for="email">E-mail</label></td>
                        <td><%=usuario.getEmail()%></td>
                    </tr>
                                        <tr>
                        <td><label for="senha">Senha: </label></td>
                        <td>********</td>
                    </tr>

                </tbody>
            </table>
            <table>
                <tr>
                    <td>
                    <form action="recuperarConta" method="get">
                        <input hidden type="text" name="idConta" value="<%=usuario.getId()%>">
                        <input hidden type="text" name="telefone" value="<%=usuario.getTelefone()%>">
                        <input hidden type="password" name="senha" value="<%=usuario.getSenha()%>">
                        <input type="image" src="img/edit.jpg">
                    </form>
                    </td>
                </tr>
            </table>
            <%
                }
            %>
            <hr>
                <h2 class="intro-text text-center">Dados de Endereço</h2>
            <hr>
            <% List<Endereco> todosEnderecos = (List<Endereco>)request.getAttribute("resultadoE");
                   if (todosEnderecos!=null){
                           for (Endereco endereco: todosEnderecos) {
            %>
            <table width=70%>
                <tbody>
                    <tr>
                        <td width=20%><label for="cep">Cep:</label></td>
                        <td width=40%><%=endereco.getCep()%></td>
                        <td width=15%><label for="bairro">Bairro:</label></td>
                        <td><%=endereco.getBairro()%></td>
                    </tr>
                    <tr>
                        <td width=10%><label for="rua">Rua:</label></td>
                        <td><%=endereco.getRua()%></td>
                        <td><label for="numero">Numero:</label></td>
                        <td><%=endereco.getNumero()%></td>
                    </tr>
                    <tr>
                        <td><label for="cidade">Cidade:</label></td>
                        <td><%=endereco.getCidade()%></td>
                        <td><label for="estado">Estado:</label></td>
                        <td><%=endereco.getEstado()%></td>
                    </tr>
                    <tr>    
                        <td><label for="complemento">Complemento:</label></td>
                        <td><%=endereco.getComplemento()%></td>
                    </tr>
                
                </tbody>
            </table>
            <table>
                <tr>
                    <td>
                        <form action="recuperarEndereco" method="get">
                            <input hidden type="text" name="idEndereco" value="<%=endereco.getId()%>">
                            <input hidden type="text" name="cep" value="<%=endereco.getCep()%>">
                            <input hidden type="text" name="rua" value="<%=endereco.getRua()%>">
                            <input hidden type="text" name="numero" value="<%=endereco.getNumero()%>">
                            <input hidden type="text" name="cidade" value="<%=endereco.getCidade()%>">
                            <input hidden type="text" name="estado" value="<%=endereco.getEstado()%>">
                            <input hidden type="text" name="complemento" value="<%=endereco.getComplemento()%>">
                            <input hidden type="text" name="bairro" value="<%=endereco.getBairro()%>">
                            <input type="image" src="img/edit.jpg">
                        </form>
                    </td>
                    <td>
                        <form action="excluirEndereco" method="get">
                            <input hidden type="text" name="idEndereco" value="<%=endereco.getId()%>">
                            <input type="image" src="img/delete.jpg">
                        </form>
                    </td>
                </tr>
            </table>
                
            <hr>
            <%
                }}
            %>
            <p><a href="cadastroEndereco.html">Você pode cadastrar um endereço clicanco aqui</a></p>
            <br><a href="home.html">VOLTAR</a>
            
        </div>
    </div>


    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="col-lg-12 text-center">
                <p>Copyright © VendeMais 2016</p>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>