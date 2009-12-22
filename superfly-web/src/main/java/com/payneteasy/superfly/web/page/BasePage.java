package com.payneteasy.superfly.web.page;

import org.apache.wicket.PageParameters;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.panel.FeedbackPanel;

public class BasePage extends WebPage{
	public BasePage(PageParameters params) {
		this();
	}
	public BasePage(){
		
		FeedbackPanel feedbackPanel = new FeedbackPanel("feedback");
		add(feedbackPanel);

	}
}