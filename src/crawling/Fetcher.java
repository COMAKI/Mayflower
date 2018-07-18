package crawling;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Fetcher {
	private long lastRequestTime = -1;
	private long minInterval = 1000;

	public Elements fetch(String url) throws IOException {
		sleepIfNeeded();

		Connection conn = Jsoup.connect(url);
		Document doc = conn.get();
		
		Element content = doc.getElementById("content_container");
		Elements paras = content.select("p");

		return paras;
	}

	public Elements read(String url) throws IOException {
		URL realURL = new URL(url);

		String slash = File.separator;
		String filename = "resources" + slash + realURL.getHost() + realURL.getPath();

		InputStream stream = Fetcher.class.getClassLoader().getResourceAsStream(filename);
		Document doc = Jsoup.parse(stream, "UTF-8", filename);

		Element content = doc.getElementById("content_container");
		Elements paras = content.select("p");
		return paras;
	}

	private void sleepIfNeeded() {
		if (lastRequestTime != -1) {
			long currentTime = System.currentTimeMillis();
			long nextRequestTime = lastRequestTime + minInterval;
			if (currentTime < nextRequestTime) {
				try {
					// System.out.println("Sleeping until " + nextRequestTime);
					Thread.sleep(nextRequestTime - currentTime);
				} catch (InterruptedException e) {
					System.err.println("Warning: sleep interrupted in fetchWikipedia.");
				}
			}
		}
		lastRequestTime = System.currentTimeMillis();
	}

	public static void main(String[] args) throws IOException {
		Fetcher wf = new Fetcher();
		String url = "https://www.facebook.com/kmaskylove/";
		Elements paragraphs = wf.read(url);

		for (Element paragraph : paragraphs) {
			System.out.println(paragraph);
		}
	}
}