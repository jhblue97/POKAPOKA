package com.poka.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class ScraperScheduler {

	private final WebScraper webScraper;

	@Scheduled(cron = "5 * * * * *")
	public void runningScraperJson() {
		System.out.println("run Scheduler");
		webScraper.createJsonToScraper();
	}

}
