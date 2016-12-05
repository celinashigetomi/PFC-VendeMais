<%@page import="modelo.Compra"%>
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
                <h2 class="intro-text text-center">VERIFIQUE OS DADOS DA COMPRA</h2>
            <hr>
            <%
                Compra compra = (Compra) request.getAttribute("resultadoC");
                if(compra!=null){
                    Anuncio anuncio = (Anuncio) request.getAttribute("resultadoA");
                                if(anuncio!=null){
            %>
                <form role="form" action="finalizarCompra" method="POST" >
                <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">

                <table width=60% border="1">
                <tbody>
                    <tr>
                        <td><label for="titulo">Titulo: </label></td>
                        <td colspan="3"><%=anuncio.getTitulo()%></td>
                    </tr>
                    <tr>
                        <td valign=top><label for="descricao">Descrição: </label></td>
                        <td colspan="3"><%=anuncio.getDescricao()%></td>
                    </tr>
                    <tr>
                        <td colspan="3"><label for="quantidade">Quantidade disponivel no estoque:</label></td>
                        <td><%=anuncio.getQuantidade()%></td>
                    </tr>
                    <tr>
                        <td colspan="3"><label for="quantidadeDesejada">Quantidade Desejada: </label></td>
                        <td><%=compra.getQuantidade()%></td>
                    </tr>
                    <tr>
                    	<td><label for="estado">Estado: </label></td>
                        <td><%=anuncio.getLargura()%></td>
                        <td width=10%><label for="peso">Peso: </label></td>
                        <td width=30%><%=anuncio.getPeso()%></td>
                    </tr>
                    <tr>
                        <td><label for="altura">Altura: </label></td>
                      	<td><%=anuncio.getAltura()%></td>
                        <td><label for="largura">Largura: </label></td>
                        <td><%=anuncio.getLargura()%></td>
                    </tr>
                    <tr>
                        <td><label for="categoria">Categoria: </label></td>
                        <td><%=anuncio.getCategoria()%></td>
                        <td><label for="subcategoria">Subcategoria: </label></td>
                        <td><%=anuncio.getSubcategoria()%></td>
                    </tr>
                    <tr>
                        <td><label for="preco">Preço: </label></td>
                        <td><%=anuncio.getPreco()%></td>
                        <td><label for="total">total: </label></td>
                        <td><%=compra.getTotal()%></td>
                    </tr>
                </tbody>
                </table>
                    <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">
                    <input hidden type="text" name="titulo" value="<%=anuncio.getTitulo()%>">
                    <input hidden type="text" name="descricao" value="<%=anuncio.getDescricao()%>">
                    <input hidden type="text" name="quantidade" value="<%=anuncio.getQuantidade()%>">
                    <input hidden type="text" name="preco" value="<%=anuncio.getPreco()%>">
                    <input hidden type="text" name="estado" value="<%=anuncio.getEstado()%>">
                    <input hidden type="text" name="peso" value="<%=anuncio.getPeso()%>">
                    <input hidden type="text" name="altura" value="<%=anuncio.getAltura()%>">
                    <input hidden type="text" name="largura" value="<%=anuncio.getLargura()%>">
                    <input hidden type="text" name="categoria" value="<%=anuncio.getCategoria()%>">
                    <input hidden type="text" name="subcategoria" value="<%=anuncio.getSubcategoria()%>">
                    <input hidden type="text" name="total" value="<%=compra.getTotal()%>">
                    <input hidden type="text" name="qtdDesejada" value="<%=compra.getQuantidade()%>">
                    <input hidden type="text" name="vendedor" value="<%=anuncio.getVendedor()%>">
                <br><input type="submit" class="btn btn-login" value="CONFIRMA">
            </form>

            <%
                }}
            %>
            <br><a href="recuperarCompra">CANCELAR</a>
            
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
