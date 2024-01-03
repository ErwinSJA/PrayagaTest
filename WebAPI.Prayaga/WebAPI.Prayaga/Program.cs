using WebAPI.Prayaga.Setup;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.Commons.DapperHelper;
using WebAPI.Prayaga.Interfaces.Services;
using WebAPI.Prayaga.Services.Services;
using WebAPI.Prayaga.Interfaces.Repositories;
using WebAPI.Prayaga.Repositories.Repositories;

WebApplication app = DefaultDistribtWebAPI.Create(args, webappBuilder =>
{
    webappBuilder.Services.AddTransient<IDapperHelper, DapperHelper>();
    webappBuilder.Services.AddTransient<ICapaActualService, CapaActualService>();

    webappBuilder.Services.AddScoped<IFacultadService, FacultadService>();
    webappBuilder.Services.AddScoped<IFacultadRepository, FacultadRepository>();
    webappBuilder.Services.AddScoped<ICarreraService, CarreraService>();
    webappBuilder.Services.AddScoped<ICarreraRepository, CarreraRepository>();
});

DefaultDistribtWebAPI.Run(app);