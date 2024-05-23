package com.article.model;

import java.time.LocalDateTime;

import com.forum.model.ForumVO;

public class testHibernate {
	public static void main(String[] args) {
		ArticleDAO dao = new ArticleDAO();
		ArticleVO art = new ArticleVO();
//		art.setArticleState(1);
//		art.setContent("<p><span style=\"color:hsl(0, 0%, 0%);\">灰狼、溜馬上次進分區決賽！KG領軍三巨頭不敵湖人　PG在陣輸熱火 記者路皓惟/綜合報導 2024-05-20 11:40:33 ｜ 2024-05-20 11:53:53 NBA季後賽次輪今（20）日全部結束，印第安納溜馬隊以破紀錄的67.1%的命中率，在G7殊 死戰以130：109淘汰紐約尼克，自2014年以來的首次挺進東區決賽，同時西區方面，明尼 蘇達灰狼隊克服20分落後上演大逆轉，最終以98：90擊敗衛冕冠軍丹佛金塊隊，這是灰狼 繼2004年後，隊史上第二度闖進西區決賽。 回顧2004年灰狼、2014年溜馬球星 灰狼上次打進西區冠軍戰以經是20年前，2004年的陣容由傳奇球星「KG」Kevin Garnett 領銜，當年KG可說是聯盟最具統治力的球星，而Sam Cassell以脾氣古怪和外露的性格著 稱，並與Latrell Sprewell及KG組成「灰狼三頭怪」，不過灰狼在西區冠軍戰與洛杉磯湖 人鏖戰6場後出局。 至於溜馬隊上次闖進東區冠軍賽已是2014年，當年陣中擁有一批才華橫溢的球星，那時的 Paul George還是球隊的中流砥柱，中鋒Roy Hibbert坐鎮禁區展現強大威力，David West 則以其老將經驗扮演關鍵角色，而George Hill則在控球後衛掌控著節奏，但最終溜馬在 東決以2：4不敵邁阿密熱火。 從孩子到球星：新世代扛起大旗 時光飛逝轉眼間溜馬與灰狼再次打進分區冠軍戰，當年兩隊陣中的主力球星幾乎都已經退 役，而現今的主力球員在上次球隊達到這個成績時，都還只是個孩子。 目前灰狼由Anthony Edwards領軍，22歲的他被譽為是NBA下一個看板球星，更被認為是「 Michael Jordan（喬丹）」接班人，他的得分能力讓球迷為之瘋狂，而Karl-Anthony Tow ns則是內外兼修的五號位，他能統治禁區，也能在外線出手，Rudy Gobert的防守能力足 以改變戰局，這些球員曾經都是年輕的球迷，如今有機會創造自己的傳奇。 溜馬方面，Tyrese Haliburton將帶領球隊繼續朝隊史首冠邁進，他的得分能力至關重要 ，Myles Turner的封阻能力也是球隊的一大武器，透過交易補強的Pascal Siakam則是完 整溜馬的內線戰力，做到跑轟戰術所需的高度、速度和攻守平衡，如今他們也扛起球新火 炬。&nbsp;</span></p><p><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgSEhURERESEhISGBISERESERERGBQZGRgYGBgcIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISHjEhISE0NDQ0NDE0MTQ0NDQ0NDQ0MTQ0NDQ0NDQ0NDQ0NDQxNDQxMTE0MTQ0NDw0NDQ/NDQ0P//AABEIALkBEAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAADAQIEBQYABwj/xAA4EAACAQIEBAQEAwcFAQAAAAABAgADEQQFEiExQVFhBiJxgRMykcFCobEHFVJictHwFCOC4fFT/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EACARAQEAAgMBAAMBAQAAAAAAAAABAhEDEiExBCJBE1H/2gAMAwEAAhEDEQA/AJCUoZaUcsKpng2vbMWnHinHAwqybQF8OKtOGi7RBDxVPaZLOKc2OLcWmQzlxedX431jzfFD+Ieono3hn5R7Tzq93HrPR/DHyidnN8jm4/ta5DtHXnn2I/aJod0+AWCMyXDkG6m3TqDLnJ/GuFxBCazSqH8FWy3PZuBmNwyk+KmUtacmcDBh794t5O1aGUx94JDCSoix144GD3j1Q9DKmyp4Mepjfht0McEPQy5sqWITIeYZnSoLqqutMdzv9J5X4t/aG9YmhgyadO9jW3FR9vw/wDjvxPaXj6izTeZ/41wuFJRn11Bxp07My/1HgPeTPCXiJMdSaqgK6XKFGILKQARe3UEGeH4DLAwLNudzc9ffjN5+x7UtTF07WQCg/wDyOsfoPylzQylk29UWOAjVjxLjOuAnERwnSiMtEIhLTrQARWU+YrvLwrKnMF3gJUfDJtB10kjD8IyvLiL9YlHMKKkAsKonz9e3BVeEV4ILHqsmqGFScakaBF0xUIeOqbTHZq9zNdj12mNzTjO38WObn+I2GHmHrPSvDvyieZ4V/OPWeleHn8onRzfGPF9ZDO8tFLFVFe4R6hqIeTK/mNugvqHtKfM8uXiLe2xnoPjvBfEpLUW+qje4AF2pnj9CAfrMJTfUpGwAPLc+3WXx5dsYjKdboDKfFeKwnlDF6f8ABUuyj0P4fabDJv2hq7Baqgaja42AmHxlLb5T7gSkqUmVtrj68ZWXFjkmZ2PqHLDTqotRPldQwN+snLhV9Z4t+zbxHiiy4QANTW5JO2hL7278Z7Rh2OkX6QxxkurE5W/djimvQR9hG640vNPGZzMBxme8WZ8mGou7MFbQdIvuW4C3vCeIXqfDb4Rs+k6Tx80+ec8xOKq1NOIaozqSulr7bnYCRbu6XJqbMzTOKmIclmZix3uSduUJgsJwtxkTB4bfjvLnD4Zhw39G3P8AxIj1J5Dltu6m00YLYAd/+rze/srwhVK9VtmqVEp8vlRb/q5+kxaAgWsW/lDENbrZv7zf+B3VaegFiblirDSVJPA77xXxV9bZTHgyOjQqmXKysFEdGKYsoix0bedeAKZU5hxlrKnMIFAaHCBxDQ1DhI+JE0L+saohVEYphFM+er2jxHgwd4qmJQwMW8GDF1RaCDj22MxeaHf3mxzBtpi8zbzTt/Fjl50fDHzj1npPh4+UTzPCHziel+Hj5RNuf4y4frR4ioukhrWIIIPMTzmthlRmp0xZVuBYbkcbek3mZYtUQsbXA7TB4bCviapdRcA8mtb84cHmy5la2EZzYEFv4VOpx6gDb2uYWj4ZdzbSSrdCCO41fhPS+x7TfYTL0VQtRFYj8f4/Zv8AsGTqdEDdfN34n3HP1nTWGzfC+SUqCLoUK9vMbAEnv3mlbEhRubTP1cb8NdR2lNj83YEOT5bj0t/lpG9fD62tomYqbi42jFzJTz4zzxMz1Ow1bFSRb/O0I+Le4p67FQCT2EVypzGN+a4Ydb8pkvEGQ06hLhRrtu/PsAP84RMNm5DinqvbiTwEuUYMOW/OG9nrTDJ4Jv8AjFO++3mYdfsP/N42IyarRPlXXTG+t1AB7KLXJ7gfWegPTI4EA9dibe/OBqVaa3Lrc83c6jb3vaVtLzdMwW9nw6uAeFmQm3MatrzTZBn1BWUCjUQG97sxUH0MheJcvwFUF0dkcb2p62N/SYTA4n4dW2suitwBIbbs1rQvsOXVfROFxIcAjYH0kxWmV8O59TqINtBsBZjczSo9+EWOX/RlElWjtUjq0eGmkrOwW868GGi6o9loS8qce28si0pse+8NjR1A7QGIhKB2kbFNsZqlj1aEVpEV4ZXnzz2h7xwMCHih4qpIvO1QHxJxqQCJmDbGYzMW801eY1NjMfj2807vxo4+emYL5xPSvDzeUTzTAHziekZD8oEv8j4jh+m+MM0VaelQGP2mSyvxdiEtTpq2m+1wLD2/9myz7Jy9go4zsr8J00AaoLte9uUrhsmKeWW5J2VVajqHchr8ipRh/cSdiawQcQLdL/aOqFEHlIAA5Nw9jMxnWdUk4uWf+FQdX5cJrtnoTO8wujbgix4H+8z3+uJpjiSVO1+3KVmY54pvTdWTUOZBtfrbh7yLh6psq3BQHY35b/lH1Ls2ngjAfGrgsCUFNx2IDf8AZnZ7QahiHUk7kae912/S023gfL1TDpUG7PTG/a5NvqZG8f4FWoNXt/uUhqB6g7WMu4+ImX7POMsxh/1BBOwF9z5RNbg80XUFB1el9vtaectXWkxqHUznYDqTJeX55Uvp0KmoAjUCNYv/AHB5cpn1t+NZlJ9euYaqGG5t77mdi8IHW3lt3awmDw/iXRb4iEA3GpGJAI6giXuD8VoSALkn+X7xW2fT174rcw8FfEJPl9NgD9zKweDSh1Moa3S5npGCx6VOXuRb6Se2FBEUt/lF1/Yx/hbLPPcrsOt5tVFtozB4MIbgSViU2vFjLN2nllLqBq8eHkVXjtUqZJuKSHi65HDxdcrsnqMz7Skx77y0Z9pQY+pvHjfRZ4k0au0BialwZGR9pzvtOhlpkFaEV4NVjwJ4D2YKHjg0GohAJIdecTHWjSsSlZmDbGZPGt5pqsx5zJYw+aeh+P8AHFziZd84np/henqKj0nl+W/OJ7D4Iw4K6zxl807WRHHdS1oqlADe3CVGb1LLtt67S+riUOYKdwbG8vrrxEy2w2PrksQtRxcH5W+xkPAYRPOWBqHUh1MfNYNdvyvJGaYAlyFJ1b7HnG5fldRm0rqDch1lYeIyZLOsNUp13XgG1EGwsUZSCAbcCCfrJnhnKXd0psLLUa6E7cL39iAZ6TQ8LV6ihaippH/0RGt6G0LhfC9SjjEqkq9GmpOo2DK2kjSB0udp0XVZTcbLKaC06a002VBYDoIDPqAqUaiGxHw248LgXH5iS8MhttHVUFiCL3BBB5gxX4U+vn+vlTV0ZkF3sGVBxsN2t3/tK/KspqfEDaWUUzdmZSBe3Due09VreD3R2dGQUVsyoos1ua36j/LTP5oSLjUzkeoHTiTJmUk9jSzd8qoxuJUFV2sl+wLE3JjMFjSWHHTfbblI9SmWJvYdh/m8mZZQGq5vsfQHtxmWV2vGNzk1TYEixtNZhqmod5kcrqG4BFr+l5p8NTsNr/laRF5LKmYd0uONpHoJJNtppPjL+qirsbRuuNxhIbeR/iTC5aromO4mB52qRQ8XXCZC4pDvsZm8wreaXNSpsZls0q7y8Mv2Tlj+qZTr+WCfEyvSt5YF6s6uzDSOGi3kZXjw88PT1UgGEUyKHj1eKntKBnGADxxqST2rMzOxmTxQ801OYbzP1aJvPQ4PI4+b6Zla+cT3DwfQC0QbbmeOZbhjqG09q8MP/sqOFhabX3KMvmNWldZV4+jcG0uGXUJCqYZuFrzSxjMmPxOFUna1/wCIcj7f3l74eytVPxGszcr729JKfA230k9uX0h8LUA8p8nYm0McdX0ZZbni5Q7QOIQWjVe/Bl+u8Vtxa9j1B4GbMj6FgotOrEbDmZmcRmVWm5p1AVHzK4sabqDvY8jvwMlZRiqtVmJBSkrFdbEFntx0gcB3P0kb342/ysnbfjQIlhM94myGnVRnRFFTjcKLse5l8XHURrdtR9BtHWUeMLlxDWKMRf8Ah0j8hLnLcuIGoqF6A8Sf87Tb4zB0y19C/EP8u5PWGwuWc3IJ6AWAmNxtreZyRSYLBkbnc++wl5h15WkxcEohFo2hMNJueyosdeJwiEy6mKnNHF+XrKzXJuboQbyq+JOLO/s7cJ+qUHnapH+JG/EkTJfUaq+xmSzcm5tNOzSsxeF1Ssc9XacsdzTMpXYRGxBls+WwD5fN/wDZl/lVaDHBoNQY/SZwdK6+xwaODQYWGo0GY2AMOlHaFDR6gmWWGyV25GX2XeHLbsJWPFlU5cmMZRMpd+AMsMF4RJ3aegYbLFUcJOTDgcp24YWRy58ktZLA+FUT8MvaWF+GABw6S2CSLiDvNOv9ZdrfCUnhlEjKp5SSWttNYzycVkevh1bioPrJQMRo0K//AFKp5W0i38u0X4o4jSfQR2JwQcWP5SlrZa6WKElQdxJtsVJK7xBUR0KPY7G2m+oHtaOynHoEVQQoAtYiEwtNGF2ADcwTCnDIATttDe/Wu516pyYsHmLdiBAtmaX0rdm7EmVzUXc2QaV4X+8ssswCrdiPMTuesW7fiLJErDIeJN772PKS1ERVj7y0unRLxuiAI4glUw1jEKHrJsVEDNaJZNuXWZZtjxH1v+k12PQlD1tMZV2YjnecXPNV2cF3BS3v+UaakEWiXmG2+hdUazxl4hMNlojNAMY5zBMY9jSZg/C5I80sKXhNedzNnToAQgQTvnDi4bzVk18K0/4ZOw2QonBRL+0RpX+eKf8ATJDp4NRyh0pgR95wlSRPa04LFtOBnXj0nbjIlW15KYyFUO8KcPB6RVWIHEehjKlCRdM7VHQIMiNKXj2jrQJAqZch4j6RqYFF4LfsTLAiNtFZFS0NKQG4Av8AaFCRyiOtCETTEVesVmnLGC6bRbRDFDQMhEaTHMYxnHWAgGLsVN+kxGLUhzfrNpiq6WIYgbdZicY66zY3F+s4vyf47Px/6ZGztY6xNQnI6i3nGN1RC0ZGvAmEcwRMYergzokW89Z5TiYJ2j2MA5gZ94oMAXio8kJIMW8EGjg0oFcyJVXeSXMj1Gk5Hijm15IWsJDbfrCU6JhNjLSarCPDSGEIjlqEcY9p0mARrGMV4oPMw2TifeJHaogaMFvHAxpnaoBzm2/SPLQNRri0aoNoGNqnO45yOBvecz3i2NOqVSOEhYlHcHSQpI42k1EB35woT0kWdly6eUZ3i69Fyjsdrkb8RKf98E8/Nxt+s9T8T+HkxKHygVVHlbUV36EjlPIcfktWm5RlKMp5/wDu85s+PV9dOGe54ljOe8cM47yjbLnEYcvfvM+sX2yaAZx3jv3x3mabBv3gmw794dYO+TUHN+879695lGRx1jSH7x9InvX02XjTVla2NHWRquYAc56DiXBqwb1JQPnCjnG/vhOsCXLPHJVmfbN06w1PMl6iSqetAlSFV5UYbFBucn02lDSUWkau0IXkaqCxtIyVjBKYkpFjKdOwkhFlRORumMenJAWLphokAqV9I9Xkl0ldiEKm/KK+GkFo0N+UjJWuI4NDZaSdcGzfnBl7CIj2uTAJKCw34xjVOUiHEEnbnwhEI9YbMa5MJTSMQX47D9YdYaLbkXof0hPTeIsKI9DYQB52lB4jyUVB8QC7DjYXJE0do1hJyxmU1VY5XG7jyqpgkBttfva8auBXtNH4pycpeslypO67DT3mNbHkbHaceXHlK7Mc5Ynvly9BAtlqnlIT5qROXNT1i60+0FbK16QNTKR0i/vWOOZQ65FvFrLP1gKtNjzk4MI1rdROvs5+qkrYRjzkV8K45y+cr6yO/YQ7DrGeei46xiVHB4mXVWkTIr4WHajrIssnxh5majD4jaYvDIV4S5wNZr2jlKxqEe8PRp8+ch4Y3EsEaVE3wSEVoG8cGlIGBjhBBoRTAHWg6tIMLQs6AZ/FIUbhYH6RUqc5d1KYYWIBlPicCU3Xdf0k60e9hvVHORq2JubDhAVGJ2kZiSwQbkgsf5V7ybQsKNXVcKflsCZMpVFGwtt/hJlIXOkpTvsDdurcBJOApadNzewa56sDb+8qFV5rBhQ8hl7DbibfmYdDeUSZThQIymIWBktGtHxjQCNXphlKsLgi1p5N4jy56dRgEcJc2ZhfbtyAnrjGZnxrhA9HUW06DcXuQe20yznm2uF908qemYgpGGcWM7VtMdtdIrIbzql7QgfeBqvGbdAk8Xv6Qtl9T/V9hKk/KP6j95Ow/Aeg+8IVSw5PC30t+sRj13gqnzD0hKfH2H6xkTTfr9pxp247RRxaEPySoAtIhaVSxtwjKfCI33jJpste631aj2lirzN5Jxb0l4s0xZZfUwPHqYBY+UkdDDKZGp8YYQIUR0YsfAOiMt4s6AVOOy7iV58pVphdGofjqHc9uk1D8JR435xFor8ASmqAgct/VojU7LYcbWgV4n1Ekvyla8TsdD5bnj95Iwsir8q+pkrDSaqLFI+MSPjN0Ywj41oACpKvN3QU3+IAUIINxce8takqsz+R/wCkzPL4vH68jxNMajp+W5sL3kV9hJ2J4+8hVZjG9R0PEyO53khflPvI78Yw/9k=\" width=\"272\" height=\"185\" alt=\"貓\"></p><p><br>&nbsp;</p>");
//		art.setIssueTime(LocalDateTime.now());
//		art.setTitle("NBA");
//		art.setArticleState(1);
//		art.setLikeSum(1000);
//		art.setPageView(12500);
//		art.setUserNumber(3);
//		ForumVO forumVO = new ForumVO();
//		forumVO.setForumNumber(1);
//		art.setForumVO(forumVO);
//		dao.insert(art);
		
//		List<ArticleVO> art = dao.findByKeyWord("科");
//		for(ArticleVO article : art) {
//			System.out.println(article.getTitle());
//		}
//		List<ArticleVO> art = dao.getPopularArticle("科學版");
//		for(ArticleVO article : art) {
//			System.out.println(article.getContent());
//		}
	
		
	} 
}