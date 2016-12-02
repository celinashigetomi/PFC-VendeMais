package modelo;
import controle.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

public class Compra {
    private int id;
    private Comprador comprador;
    private Vendedor vendedor;
    private int quantidade;
    private Date data_compra;
    private Anuncio anuncio;
    private double total;

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Comprador getComprador() {
        return comprador;
    }

    public void setComprador(Comprador comprador) {
        this.comprador = comprador;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Date getData_compra() {
        return data_compra;
    }

    public void setData_compra(Date data_compra) {
        this.data_compra = data_compra;
    }

    public Anuncio getAnuncio() {
        return anuncio;
    }

    public void setAnuncio(Anuncio anuncio) {
        this.anuncio = anuncio;
    }
    
    public void gerarHistorico(Compra compra) throws ClassNotFoundException, SQLException{
        Connection con = FabricaConexao.getConexao(); 

        PreparedStatement comando = con.prepareStatement("insert into historico (data_compra,quantidade,total,comprador_id,anuncio_id) values (?,?,?,?,?)");
        comando.setDate(1,compra.getData_compra());
        comando.setInt(2,compra.getQuantidade());
        comando.setDouble(3,compra.getTotal());
        comando.setInt(4,comprador.getId());
        comando.setInt(5,anuncio.getId());
        
        comando.execute();
        con.close();
    }
}