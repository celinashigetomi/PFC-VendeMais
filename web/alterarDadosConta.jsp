<%@page import="modelo.Usuario"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="img/i.ico" >

    <title>ALTERAÇÃO DE DADOS</title>

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
        <div class="box" style="width: 40%;"  align="center" >
            <hr>
                <h2 class="intro-text text-center">alteração de dados</h2>
            <hr>
            <%
                Usuario usuario = (Usuario) request.getAttribute("resultado");
                if(usuario!=null){
            %>
            <form role="form" action="alterarConta" method="POST" >
                <input hidden type="text" name="id" value="<%=usuario.getId()%>" >
                <label for="telefone">Novo telefone: </label><br>
                <input type="text" name="telefone" value="<%=usuario.getTelefone()%>" id=telefone required><br>
                <label for="senha">Nova senha: </label><br>
                <input type="password" name="senha" value="<%=usuario.getSenha()%>" id=senha required ><br>
                
                <br><input type="submit" class="btn btn-login" value="SALVAR">
                
            </form>
            <%
                }
            %>

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
