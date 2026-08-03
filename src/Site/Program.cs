using System.Diagnostics.CodeAnalysis;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

namespace Werecodent.Site;

/// <summary>Contains the assembly's entrypoint.</summary>
[ExcludeFromCodeCoverage]
internal static class Program
{
    /// <summary>Initializes and runs the website.</summary>
    /// <param name="args">Command-line arguments.</param>
    /// <returns>A <see cref="Task"/> that represents the asynchronous operation.</returns>
    public static Task Main(string[] args)
    {
        return ConfigureHost(args).Build().RunAsync();
    }

    internal static WebAssemblyHostBuilder ConfigureHost(string[] args)
    {
        WebAssemblyHostBuilder builder = WebAssemblyHostBuilder.CreateDefault(args);
        builder.RootComponents.Add<App>("#app");
        builder.RootComponents.Add<HeadOutlet>("head::after");

        _ = builder.Services.AddScoped(_ => new HttpClient
        {
            BaseAddress = new Uri(builder.HostEnvironment.BaseAddress),
        });

        return builder;
    }
}
