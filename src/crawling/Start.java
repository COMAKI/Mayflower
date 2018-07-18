package crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Start {

    final static List<String> visited = new ArrayList<String>();
    final static Fetcher wf = new Fetcher();

	public static void main(String[] args) throws IOException {
		
		String destination = "https://en.wikipedia.org/wiki/Philosophy";
		String source = "https://www.facebook.com/kmaskylove/";
		
		testConjecture(destination, source, 10);		
	}

	public static void testConjecture(String destination, String source, int limit) throws IOException {
		String url = source;
		for (int i=0; i<limit; i++) {
			if (visited.contains(url)) {
				System.err.println("We're in a loop, exiting.");
				return;
			} else {
				visited.add(url);
			}
			Element elt = getFirstValidLink(url);
			if (elt == null) {
				System.err.println("Got to a page with no valid links.");
				return;
			}
			
			System.out.println("**" + elt.text() + "**");
			url =  elt.attr("abs:href");
			
			if (url.equals(destination)) {
				System.out.println("Eureka!");
				break;
			}
		}
	}
	
	public static Element getFirstValidLink(String url) throws IOException {
		print("Fetching %s...", url);
		Elements paragraphs = wf.fetch(url);
		Parser wp = new Parser(paragraphs);
		Element elt = wp.findFirstLink();
		return elt;
	}
	
	private static void print(String msg, Object... args) {
		System.out.println(String.format(msg, args));
	}
}