package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SCController {
	String line = "";
	
	@RequestMapping("schedule/schedule")
	public ModelAndView sc() throws Exception {
		ModelAndView mav = new ModelAndView("schedule/schedule");
		List<String> paths = Arrays.asList("2018_2019_schedule.xlsx");
		List<String> list = new ArrayList<String>();
		for (String path : paths) {
			Workbook tempWorkbook;
			if (path.endsWith(".xls")) {
				tempWorkbook = new HSSFWorkbook(new FileInputStream(path));
			} else if (path.endsWith(".xlsx")) {
				tempWorkbook = new XSSFWorkbook(new FileInputStream(path));
			} else {
				throw new IllegalAccessError("xls / xlsx 확장자만 읽을 수 있습니다.");
			}
			try (Workbook workbook = tempWorkbook) {
				System.out.println("경로 : " + path);
				Sheet sheet = workbook.getSheetAt(0);
				System.out.println("첫번째 sheet 읽음");
				// 행을 가져옵니다.
				for (Row row : sheet) {
					// cell (행의 각 열) 을 가져옵니다.
					
					row.forEach(cell -> {
						System.out.print(cell.toString());
						System.out.print(" || ");

						line += cell+" ";
					});
					list.add(line);
					line = "";
					
					System.out.println();
				}
				System.out.println(list);
			}
		}
		return mav;
	}
	
	@RequestMapping("schedule/CrowlingSchdule")
	public ModelAndView CrowlingSchdule() {
		ModelAndView mav = new ModelAndView("schedule/scheMain");
		String schedule = schedule();
		mav.addObject("schedule", schedule);
		return mav;
	}
	private String schedule() {
		String url = "https://www.kbl.or.kr/schedule/today/calendar.asp?tdate=20190107&CalDate=2019-01-07&SchSeason=S1";
		String line2 = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("div.calendar_list");
			String tmpline = div.toString();
				line2+=tmpline;
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(line2);
		line2 += "";
		return line2;
	}
}
