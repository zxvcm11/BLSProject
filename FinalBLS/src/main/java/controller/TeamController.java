package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
	Map<String, Integer> teamCode = tCode(); //teamCode() => key : 팀명, value : 팀번호 
	
	List<Integer> tcode = new ArrayList<>();
	for (String s : teamCode.keySet()) {
		tcode.add(teamCode.get(s));
	}
	Map<String, Integer> pCode = pCode(tcode); //pCode(팀 번호) =key : 선수 번호, value : 팀 번호
	
	
	List<String> tName = new ArrayList<>();
	for (String s : pCode.keySet()) {
		tName.add(s);
	}
	Map<String, String> pName = pName(tName); //pName(선수 번호) =>key : 선수 번호, value : 선수 이름
	
*/
@Controller
public class TeamController {
	
	@RequestMapping("team/mainPage")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/main");
		Map<String, String> teamCode = tCode();
		Map<String, List> teamrank = MainRank();
		Map<String, List> playerrank = MainPRank();
		// teamCode() => key : 팀명, value : 팀번호 
		session.setAttribute("teamCode", teamCode);
		mav.addObject("Rank",teamrank);
		mav.addObject("PRank",playerrank);
		return mav;
	}



	@RequestMapping("team/teamMain")
	public ModelAndView tMain(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/tMain");
		Map<String, String> teamCode = tCode();
		List<String> score = tRankS(session);
		List<String> title = tRankT();
		List<String> teamRankName = teamRankName();
		List<String> tcode = new ArrayList<>();
		List<String> tName = new ArrayList<>();
		for (String s : teamCode.keySet()) {
			tcode.add(String.valueOf(teamCode.get(s)));
		}
		Map<String, String> pCode = pCode(tcode);
		for (String s : pCode.keySet()) {
			tName.add(s);
		}
		Map<String, String> pName = pName(tName);
		// pCode(팀 번호) =key : 선수 번호, value : 팀 번호
		session.setAttribute("teamCode", teamCode);
		mav.addObject("teamRankName", teamRankName);
		mav.addObject("score", score);
		mav.addObject("title", title);
		mav.addObject("pCode", pCode);
		mav.addObject("pName", pName);
		return mav;
	}
	//팀 세부정보
	@RequestMapping("team/tInfo")
	public ModelAndView tInfo(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("team/teamInfo");
		String tnum = request.getParameter("tcode");
		Map<String, String> pCode = plCode(tnum); //pCode(팀 번호) =key : 선수 번호, value : 팀 번호
		List<String> tName = new ArrayList<>();
		for (String s : pCode.keySet()) {
			tName.add(s);
		}
		Map<String, String> pName = pName(tName); //pName(선수 번호) =>key : 선수 번호, value : 선수 이름
		Tinfo(tnum);
		mav.addObject("teaminfo",Tinfo(tnum)); //팀 정보
		mav.addObject("pCode", pCode);
		mav.addObject("pName", pName);
		return mav;
	}

	
	
	@RequestMapping("team/pl")
	public ModelAndView pMain(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("team/player");
		return mav;
	}

	@RequestMapping("team/t1")
	public ModelAndView test4(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/ts1");
		Map<String, String> teamCode = tCode();
		List<String> tcode = new ArrayList<>();
		for (String s : teamCode.keySet()) {
			tcode.add(String.valueOf(teamCode.get(s)));
		}
		Map<String, String> pCode = pCode(tcode);
		List<String> tName = new ArrayList<>();
		for (String s : pCode.keySet()) {
			tName.add(s);
		}
		Map<String, String> pName = pName(tName);
		// pName(선수 번호) =>key : 선수 번호, value : 선수 이름
		mav.addObject("pCode", pCode);
		mav.addObject("pName", pName);
		return mav;
	}

	@RequestMapping("team/t2")
	public ModelAndView test2(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/ts2");
		Map<String, String> tCode = tCode();
		session.setAttribute("tCode", tCode);
		return mav;
	}
// 여기부터 크롤링을 위한 메서드
	private List<String> teamRankName() {
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		List<String> score = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for (Element c : src.select("td:eq(1)")) {
					score.add(c.text());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return score;
	}
	
	private List<String> tRankS(HttpSession session) {
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		List<String> score = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			Map<String, String> teamCode = tCode();
			int i = 0;
			for (Element src : div) {
				for (Element c : src.select("td")) {
					String text = c.text();
					score.add(text);
					if (i % 10 == 1) {
						score.remove(i);
						score.add(getKey(teamCode, text));
					}
					i++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return score;
	}

	private String getKey(Map<String, String> teamCode, String string) {
		for (String o : teamCode.keySet()) {
			if (string.contains(o)) {
				return o;
			}
		}
		return null;
	}
	private Map<String,List> MainRank(){
		List<String> teamname = new ArrayList<String>();
		List<String> win = new ArrayList<String>();
		List<String> lose = new ArrayList<String>();
		Map<String,List> rank = new TreeMap<>();
		String url = "https://www.kbl.or.kr/main/main.asp";
		
		try {
			Document doc = Jsoup.connect(url).get();	
			Elements div = doc.select("div.row");							
			for (Element src : div) {
				for(Element c : src.select("strong.txt_team")) {	
					teamname.add(c.text());	
				}
			}
			for (Element src : div) {
				for(Element c : src.select("span.txt_win")) {	
					win.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("span.txt_lose")) {
					lose.add(c.text());
				}
			}
			rank.put("teamname", teamname);
			rank.put("win", win);
			rank.put("lose", lose);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rank;
	}
	private Map<String, List> MainPRank() {
		List<String> cont = new ArrayList<String>();
		List<String> teamname = new ArrayList<String>();
		List<String> pname = new ArrayList<String>();
		List<String> score = new ArrayList<String>();
		Map<String,List> prank = new TreeMap<>();
		String url = "https://www.kbl.or.kr/main/main.asp";	// 소스를 가져올 주소입력
		try {
			Document doc = Jsoup.connect(url).get();	// doc : url 소스 전체를 가져옴
			Elements div = doc.select("div.row");	
			// div : doc에서 div태그 중 class속성이 table_type_ht이고 mt1인 div태그를 선택
			for (Element src : div) {
				for(Element c : src.select("div.desc_block strong")) {	// div에서  (table태그안에있는)caption태그를 선택
					cont.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("div.desc_block div.name")) {	// div에서  (table태그안에있는)caption태그를 선택
					pname.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("div.desc_block div.team")) {	// div에서  (table태그안에있는)caption태그를 선택
					teamname.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("div.desc_block em")) {	// div에서  (table태그안에있는)caption태그를 선택
					score.add(c.text());
				}
			}
			prank.put("cont", cont);
			prank.put("pname", pname);
			prank.put("teamname", teamname);
			prank.put("score", score);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prank;
	}
	private Map<String,String> Tinfo(String tnum){
		Map<String,String> tinfo = new TreeMap<>();
		String url = "https://www.kbl.or.kr/teams/team_info.asp?tcode="+tnum;	// 소스를 가져올 주소입력

		try {
			Document doc = Jsoup.connect(url).get();	// doc : url 소스 전체를 가져옴
			Elements div = doc.select("dl.infotxt_2015");
			// div : doc에서 div태그 중 class속성이 table_type_ht이고 mt1인 div태그를 선택		
			int cnt=0;
			for (Element src : div) {
				for(Element c : src.select("dd")) {	
					cnt ++;
					tinfo.put("infotxt"+cnt,c.text());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tinfo;
	}
	private List<String> tRankT() {
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		List<String> title = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for (Element c : src.select("th")) {
					String text = c.text();
					title.add(text);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return title;
	}

	private String teamName() {
		String url = "https://www.kbl.or.kr/schedule/today/todaygame.asp";
		String line = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("ul.gnb__list>li:eq(2)");
			String tmpline = div.toString();
			line += tmpline;
		} catch (IOException e) {
			e.printStackTrace();
		}
		line += "</table>";
		return line;
	}

	private Map<String, String> tCode() {
		List<String> tCode1 = new ArrayList<String>();
		List<String> tCode2 = new ArrayList<String>();
		Map<String, String> tMap = new HashMap<String, String>();
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("div.foot_link");
			for (Element src : div) {
				for (Element c : src.select("li>a>img")) {
					String outCode = c.toString();
					String val = outCode.substring(outCode.indexOf("_") + 1, outCode.indexOf(".png"));
					if (val.length()<2) {
						String num="0";
						String num1=val;
						val+=num+num1;
					}
					tCode2.add(val);
				}
				for (Element c : src.select("li")) {
					tCode1.add(c.text());
				}
			}
			for (int i = 0; i < tCode2.size(); i++) {
				tMap.put(tCode1.get(i), tCode2.get(i));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}

	private Map<String, String> pCode(List<String> tcode) {  
		Map<String, String> tMap = new TreeMap();
		try {
			for (String s : tcode) {
				String url = "https://www.kbl.or.kr/teams/team_players.asp?tcode=" + s;
				Document doc = Jsoup.connect(url).get();
				Elements div = doc.select("div#subcontents>div");
				for (Element src : div) {
					for (Element c : src.select("img")) {
						String outCode = c.toString();
						String val = outCode.substring(outCode.indexOf("o/")+2, outCode.indexOf(".jpg"));
						tMap.put(val,s);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}
	private Map<String, String> plCode(String tcode) { //tinfo에서 사용할
		Map<String, String> tMap = new TreeMap();
		try {
				String url = "https://www.kbl.or.kr/teams/team_players.asp?tcode=" + tcode;
				Document doc = Jsoup.connect(url).get();
				Elements div = doc.select("div#subcontents>div");
				for (Element src : div) {
					for (Element c : src.select("img")) {
						String outCode = c.toString();
						String val = outCode.substring(outCode.indexOf("o/")+2, outCode.indexOf(".jpg"));
						tMap.put(val,tcode);
					}		
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}
	private Map<String, String> pName(List<String> tName) {
		Map<String, String> tMap = new TreeMap();
		try {
			for (String s : tName) {
				String url = "https://www.kbl.or.kr/players/player_info.asp?pcode=" + s;
				Document doc = Jsoup.connect(url).get();
				Elements div = doc.select("div#subcontents>div>div>dl");
				for (Element src : div) {
					Elements c = src.select("dd>dl:eq(0)");
					for (Element pro : c) {
						Elements dd = pro.select("dd");
						for (Element name : dd) {
							String outCode = name.toString();
							String val = outCode.substring(outCode.indexOf("d>") +4, outCode.indexOf("&"));
							tMap.put(s, val);
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}
}
