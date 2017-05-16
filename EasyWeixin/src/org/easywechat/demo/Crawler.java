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
	 * ���ݹؼ��ʲ���
	 * 
	 * @param keyWord
	 *            ���ڲ����鼮�Ĺؼ���
	 * @return ���ڷ��͸�΢���û�����Ϣ
	 * @throws IOException
	 *             if IO error happens
	 */
	public static BaseMsg findBookByKeyWord(String keyWord) throws IOException {

		String url = host + "/search*chx/Y?SEARCH="
				+ URLEncoder.encode(keyWord, "utf-8");
		Document document = Jsoup.connect(url).get();

		Elements eles = document.select(".briefcitTitle a");

		if (eles.isEmpty()) {
			// ����鼮��ѯ���Ϊ�գ��򷵻��ı���Ϣ��û���ҵ�����鼮����
			return MessageFactory.createTextMsg("û���ҵ�����鼮��");
		}

		NewsMsg newsMsg = MessageFactory.createNewsMsg();
		newsMsg.add("�鼮��ѯ�����");

		for (int i = 0; i < eles.size() && i < 8; i++) {
			Element ele = eles.get(i);

			String link = host + ele.attr("href");// �������
			String bookName = ele.text();// ����

			newsMsg.add(bookName, link);
		}

		newsMsg.add("�鿴����..", url);

		return newsMsg;
	}

	// public static void main(String[] args) throws IOException {
	// System.out.println(findBookByKeyWord("java�������"));
	// }

}
