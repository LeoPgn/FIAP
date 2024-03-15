using HtmlAgilityPack;
using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        try
        {
            var client = new HttpClient();
            var url = "https://www.metacritic.com/game/five-nights-at-freddys/";

            using (var response = await client.GetAsync(url))
            {
                if (response.IsSuccessStatusCode)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("HTML Content:");
                    Console.WriteLine(content);

                    var doc = new HtmlDocument();
                    doc.LoadHtml(content);

                    var titleNode = doc.DocumentNode.SelectSingleNode("/html/body/div[1]/div/div/div[2]/div[1]/div[1]/div/div/div[2]/div[3]/div[1]/div");
                    var title = titleNode?.InnerText?.Trim();

                    var metascoreNode = doc.DocumentNode.SelectSingleNode("/html/body/div[1]/div/div/div[2]/div[1]/div[1]/div/div/div[2]/div[3]/div[4]/div[1]/div/div[1]/div[2]/div/div/span");
                    var metascore = metascoreNode?.InnerText?.Trim();

                    var userscoreNode = doc.DocumentNode.SelectSingleNode("/html/body/div[1]/div/div/div[2]/div[1]/div[1]/div/div/div[2]/div[3]/div[4]/div[2]/div[1]/div[2]/div/div/span");
                    var userscore = userscoreNode?.InnerText?.Trim();

                    if (title != null)
                    {
                        Console.WriteLine("Title of the game: " + title);
                    }
                    else
                    {
                        Console.WriteLine("Title not found on the page.");
                    }

                    if (metascore != null)
                    {
                        Console.WriteLine("Metascore: " + metascore);
                    }
                    else
                    {
                        Console.WriteLine("Metascore not found on the page.");
                    }

                    if (userscore != null)
                    {
                        Console.WriteLine("Userscore: " + userscore);
                    }
                    else
                    {
                        Console.WriteLine("Userscore not found on the page.");
                    }
                }
                else
                {
                    Console.WriteLine("Failed to retrieve content from the page. Status code: " + response.StatusCode);
                }
            }

            // Aguardar entrada do usuário para continuar
            Console.WriteLine("Pressione qualquer tecla para sair...");
            Console.ReadKey();
        }
        catch (Exception ex)
        {
            Console.WriteLine("An error occurred: " + ex.ToString());
        }
    }
}
