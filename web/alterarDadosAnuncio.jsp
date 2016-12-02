<%@page import="modelo.Anuncio"%>
<%@page import="java.util.List"%>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="img/i.ico" >

    <title>ANUNCIOS</title>

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
                <h2 class="intro-text text-center">Dados de Endereço</h2>
            <hr>
            <%
                Anuncio anuncio = (Anuncio) request.getAttribute("resultado");
                if(anuncio!=null){
            %>
                <form role="form" action="alterarAnuncio" method="POST" >
                <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">
                <table>
                <tbody>
                    <tr>
                        <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">
                        <td><label for="titulo">Titulo: </label></td>
                        <td colspan="3"><input type="text" name="titulo" value="<%=anuncio.getTitulo()%>" style="width:400px;" id=titulo required></td>
                    </tr>
                    <tr>
                        <td valign=top><label for="descricao">Descrição: </label></td>
                        <td colspan="3"><textarea maxlength="500"name="descricao" value="<%=anuncio.getDescricao()%>" style="width:400px;height:150px;" cols="40" rows="5" id=descricao required></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="quantidade">Quantidade</label></td>
                        <td><input type="text" size=4 name="quantidade" value="<%=anuncio.getQuantidade()%>" id=quantidade required/></td>
                        <td><label for="preco">Preço: </label></td>
                        <td><input type="text" size=7 name="preco" value="<%=anuncio.getPreco()%>" id=preco required></td>
                    </tr>
                    <tr>
                    	<td><label for="estado">Estado: </label></td>
                        <td><input type="radio" name="estado" value="usado" id=estado required>usado
                            <input type="radio" name="estado" value="novo" id=estado required>novo
                        </td>
                        <td><label for="peso">Peso: </label></td>
                        <td><input type="text" size=7 name="peso" id=peso required value="<%=anuncio.getPeso()%>"></td>
                    </tr>
                    <tr>
                        <td><label for="altura">Altura: </label></td>
                      	<td><input type="text" size=7 name="altura" value="<%=anuncio.getAltura()%>" id=altura required></td>
                        <td><label for="largura">Largura: </label></td>
                        <td><input type="text" size=7 name="largura" value="<%=anuncio.getLargura()%>" id=largura required></td>
                    </tr>
                    <tr>
                        <td><label for="categoria">Categoria: </label></td>
                        <td><input type="text" name="categoria" size=10 value="<%=anuncio.getCategoria()%>"  id=categoria required></td>
                        <td><label for="subcategoria">Subcategoria: </label></td>
                        <td><input type="text" name="subcategoria" size=10 value="<%=anuncio.getSubcategoria()%>" id=subcategoria required></td>
                    </tr>
                </tbody>
                </table>
                
                <br><input type="submit" class="btn btn-login" value="SALVAR">
            </form>

            <%
                }
            %>
            <br><input type="submit" class="btn btn-login" value="CANCELAR">
            
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