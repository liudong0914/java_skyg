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
		// 返回你在微信公众平台设置的token
		return "your_token";
	}

	// onText方法响应用户发送的文本消息
	@Override
	protected BaseMsg onText(String content) {

		if (content.equalsIgnoreCase("help") || content.equals("?")) {
			// 如果用户输入"help"或者"?"
			// 则发送文本消息"输入书名查询书籍！"
			return MessageFactory.createTextMsg("输入书名查询书籍！");
		} else {
			// 如果用户输入其他文本，则去查询书籍，并返回图文消息
			try {
				return Crawler.findBookByKeyWord(content);
			} catch (IOException e) {
				e.printStackTrace();
				// 如果出现IO错误，则返回null
				// 返回null表示不响应用户
				return null;
			}
		}
	}

	// handleSubscribe方法如理用户订阅事件
	@Override
	protected BaseMsg handleSubscribe(BaseEvent event) {
		// 在用户首次关注微信号时，发送文本消息“感谢您的关注！”
		return MessageFactory.createTextMsg("感谢您的关注！");
	}

}
