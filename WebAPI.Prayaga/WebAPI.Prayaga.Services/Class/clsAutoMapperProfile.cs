using AutoMapper;
using WebAPI.Prayaga.DTOs.Carrera;
using WebAPI.Prayaga.DTOs.Facultad;
using WebAPI.Prayaga.Models.Carrera;
using WebAPI.Prayaga.Models.Facultad;

namespace WebAPI.Prayaga.Services.Class
{
    public class clsAutoMapperProfile : Profile
    {
        public clsAutoMapperProfile() 
        {
            // Facultad
            CreateMap<DToFacultad, ModelFacultad>().ReverseMap();

            // Carrera
            CreateMap<DToCarrera, ModelCarrera>().ReverseMap();
        }
    }
}
