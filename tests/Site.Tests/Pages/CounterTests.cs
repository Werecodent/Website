using Werecodent.Site.Pages;

namespace Werecodent.Site.Tests.Pages;

public class CounterTests : BunitContext
{
    [Fact]
    public void CounterStartsAtZero()
    {
        IRenderedComponent<Counter> cut = Render<Counter>();
        cut.Find("p").MarkupMatches("<p>Count == 0</p>");
    }

    [Fact]
    public void ClickingButtonIncrementsCounter()
    {
        IRenderedComponent<Counter> cut = Render<Counter>();
        cut.Find("button").Click();
        cut.Find("p").MarkupMatches("<p>Count == 1</p>");
    }
}
