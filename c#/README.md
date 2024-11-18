# Instalação do dotnet

No Linux e macOS, você pode compilar C# usando o comando `dotnet`

1. **Instale o .NET SDK** (se ainda não tiver instalado). No terminal, use os comandos abaixo para instalação:

   ```bash
   # No Ubuntu, por exemplo
   sudo apt update
   sudo apt install -y dotnet-sdk-7.0
   ```

2. **Compile e execute o código** usando o comando `dotnet`:

   - No terminal, navegue até o diretório onde deseja criar o projeto e execute:

     ```bash
     dotnet new console -o BruteForceApp
     cd BruteForceApp
     ```

   - Coloque os arquivos `BruteForce.cs` e `Program.cs` dentro do diretório `BruteForceApp`.

   - Execute o comando para compilar o código:

     ```bash
     dotnet build
     ```

   - Após a compilação bem-sucedida, execute o projeto com o comando:

     ```bash
     dotnet run
     ```
