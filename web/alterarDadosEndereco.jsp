<%@page import="modelo.Endereco"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="img/i.ico" >

    <title>ALTERAÇÃO DE ENDERECO</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <SCRIPT src="js/jquery-1.5.2.min.js"></SCRIPT>
    <SCRIPT src="js/jquery.maskedinput-1.3.min.js"></SCRIPT>
    <SCRIPT src="js/validaçãoInputs.js"></SCRIPT>
    <SCRIPT src="js/validaçãoEndereço.js"></SCRIPT>
			
</head>

<body>
    <div class="brand">Vende+</div>
    <div class="address-bar">Aqui você vende muito mais!</div>

    <!-- Navigation -->
    <div class="container" align="center">
        <div class="box" align="center" >
            <hr>
                <h2 class="intro-text text-center">alteração de dados de endereço</h2>
            <hr>
            <%
                Endereco endereco = (Endereco) request.getAttribute("resultado");
                if(endereco!=null){
            %>
            <form role="form" action="alterarEndereco" method="POST" >
                <input hidden type="text" name="idEndereco" value="<%=endereco.getId()%>">
            <table width=40%>
                <tbody>
                    <tr>
                        <td width=10%><label for="cep">CEP:</label>
                        <td width=25%><input size="9" type="text" name="cep" value="<%=endereco.getCep()%>" id="cep" cep required onblur="pesquisacep(this.value);">
                        <td width=10%><label for="numero">Numero:</label></td>
                        <td><input size="4" type="text" name="numero" value="<%=endereco.getNumero()%>" id="numero"  numero required></td>


                    </tr>
                    <tr>
                        <td colspan="1"><label for="rua">Rua:</label></td>
                        <td colspan="5"><input size="54" type="text" name="rua" value="<%=endereco.getRua()%>" id="rua" rua required</td>

                    </tr>
                    <tr>
                        <td><label for="cidade">Cidade:</label></td>
                            <td><input size="20" type="text" name="cidade" value="<%=endereco.getCidade()%>" id="cidade" cidade required></td>
                            <td><label for="uf">Estado </label></td>
                            <td><select type="text" name="uf" id="uf" uf required/> 
                                <option value="<%=endereco.getEstado()%>"><%=endereco.getEstado()%></option>
                                <option value="AC">AC</option> 
                                <option value="AL">AL</option> 
                                <option value="AM">AM</option> 
                                <option value="AP">AP</option> 
                                <option value="BA">BA</option> 
                                <option value="CE">CE</option> 
                                <option value="DF">DF</option> 
                                <option value="ES">ES</option> 
                                <option value="GO">GO</option> 
                                <option value="MA">MA</option> 
                                <option value="MT">MT</option> 
                                <option value="MS">MS</option> 
                                <option value="MG">MG</option> 
                                <option value="PA">PA</option> 
                                <option value="PB">PB</option> 
                                <option value="PR">PR</option> 
                                <option value="PE">PE</option> 
                                <option value="PI">PI</option> 
                                <option value="RJ">RJ</option> 
                                <option value="RN">RN</option> 
                                <option value="RO">RO</option> 
                                <option value="RS">RS</option> 
                                <option value="RR">RR</option> 
                                <option value="SC">SC</option> 
                                <option value="SE">SE</option> 
                                <option value="SP">SP</option> 
                                <option value="TO">TO</option> 
                            </select>
                        </td>

                    </tr>
                    <tr>    
                        <td><label for="complemento">Complemento:</label></td>
                        <td><input size="20 "type="text" name="complemento" value="<%=endereco.getComplemento()%>"></td>
                        <td><label for="bairro">Bairro:</label></td>
                        <td><input size="18" type="text" name="bairro" value="<%=endereco.getBairro()%>" id=bairro required></td>
                    </tr>
                </tbody>
                </table>
                
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
