package org.easywechat.demo;

import java.io.IOException;
import java.net.URLEncoder;

import org.easywechat.msg.BaseMsg;
import org.easywechat.msg.NewsMsg;
import org.easywechat.util.MessageFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {

	private static final String host = "http://innopac.lib.tsinghua.edu.cn";

	/**
	 * 根据关键词查书
	 * 
	 * @param keyWord
	 *            用于查找书籍的关键词
	 * @return 用于发送给微信用户的消息
	 * @throws IOException
	 *             if IO error happens
	 */
	public static BaseMsg findBookByKeyWord(String keyWord) throws IOException {

		String url = host + "/search*chx/Y?SEARCH="
				+ URLEncoder.encode(keyWord, "utf-8");
		Document document = Jsoup.connect(url).get();

		Elements eles = document.select(".briefcitTitle a");

		if (eles.isEmpty()) {
			// 如果书籍查询结果为空，则返回文本消息“没有找到相关书籍！”
			return MessageFactory.createTextMsg("没有找到相关书籍！");
		}

		NewsMsg newsMsg = MessageFactory.createNewsMsg();
		newsMsg.add("书籍查询结果：");

		for (int i = 0; i < eles.size() && i < 8; i++) {
			Element ele = eles.get(i);

			String link = host + ele.attr("href");// 书的链接
			String bookName = ele.text();// 书名

			newsMsg.add(bookName, link);
		}

		newsMsg.add("查看更多..", url);

		return newsMsg;
	}

	// public static void main(String[] args) throws IOException {
	// System.out.println(findBookByKeyWord("java程序设计"));
	// }

}
