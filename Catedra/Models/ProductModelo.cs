namespace Catedra.Models
{
    public class ProductModelo
    {
        public int? IdRecurso { get; set; }
        public string? Title { get; set; }
        public string? AnnioProduction { get; set; }
        public string? IdEditorial { get; set; }                
        public string? Edition { get; set; }
        public string? IdCountry { get; set; }
        public int? Cantidad { get; set; }
        // Para mostrarlo
        public string? Precio { get; set; }
        // Para ingresar datos
        public double? Price { get; set; }
        public string? Busqueda { get; set; }
        public string? DateAdded {  get; set; }
    }
}
