package modelo;

public class Comprador extends Usuario {
    
    public double comprar(Anuncio anuncio, int qtd){
        
        Compra c = new Compra();

        c.setQuantidade(qtd);
        double total=anuncio.getPreco()*c.getQuantidade();
        return total;
    }
}