FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["src/MarceloCastelo.Desafio.ApiProdutos.WebApi/MarceloCastelo.Desafio.ApiProdutos.WebApi.csproj", "src/MarceloCastelo.Desafio.ApiProdutos.WebApi/"]
RUN dotnet restore "src/MarceloCastelo.Desafio.ApiProdutos.WebApi/MarceloCastelo.Desafio.ApiProdutos.WebApi.csproj"
COPY . .
WORKDIR "/src/src/MarceloCastelo.Desafio.ApiProdutos.WebApi"
RUN dotnet build "MarceloCastelo.Desafio.ApiProdutos.WebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MarceloCastelo.Desafio.ApiProdutos.WebApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MarceloCastelo.Desafio.ApiProdutos.WebApi.dll"]