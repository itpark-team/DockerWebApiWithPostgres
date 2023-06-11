FROM mcr.microsoft.com/dotnet/sdk:6.0
ADD ./code /root
WORKDIR /root

EXPOSE 5000

ENV ASPNETCORE_URLS=http://+:5000
ENV ASPNETCORE_ENVIRONMENT Development

ENTRYPOINT ["dotnet", "WebApplicationTestEfRecursion.dll"]