package org.easywechat.demo;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;

import org.easywechat.msg.BaseMsg;
import org.easywechat.msg.NewsMsg;
import org.easywechat.msg.req.BaseEvent;
import org.easywechat.servlet.SimpleWeixinSupport;
import org.easywechat.util.MessageFactory;

@WebServlet("/wechat")
public class Wechat extends SimpleWeixinSupport {

	@Override
	protected String getToken() {
		// ��������΢�Ź���ƽ̨���õ�token
		return "your_token";
	}

	// onText������Ӧ�û����͵��ı���Ϣ
	@Override
	protected BaseMsg onText(String content) {

		if (content.equalsIgnoreCase("help") || content.equals("?")) {
			// ����û�����"help"����"?"
			// �����ı���Ϣ"����������ѯ�鼮��"
			return MessageFactory.createTextMsg("����������ѯ�鼮��");
		} else {
			// ����û����������ı�����ȥ��ѯ�鼮��������ͼ����Ϣ
			try {
				return Crawler.findBookByKeyWord(content);
			} catch (IOException e) {
				e.printStackTrace();
				// �������IO�����򷵻�null
				// ����null��ʾ����Ӧ�û�
				return null;
			}
		}
	}

	// handleSubscribe���������û������¼�
	@Override
	protected BaseMsg handleSubscribe(BaseEvent event) {
		// ���û��״ι�ע΢�ź�ʱ�������ı���Ϣ����л���Ĺ�ע����
		return MessageFactory.createTextMsg("��л���Ĺ�ע��");
	}

}
