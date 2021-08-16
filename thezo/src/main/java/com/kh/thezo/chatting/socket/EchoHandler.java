package com.kh.thezo.chatting.socket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.thezo.chatting.controller.ChattingController;
import com.kh.thezo.member.model.vo.Member;

// EchoHandler 클래스.
@RequestMapping("/echo") // 메핑은 /echo로 해둠 serlet-context에서 path와 일치시킨것  
public class EchoHandler extends TextWebSocketHandler{// TextWebSocketHandler를 상속박아야한다.
	@Autowired
	private ChattingController chatController;
	
	// 필드부 작성 	
    // 1. sessionList 필드 생성  WebSocketSession형태의 제네릭을 가진 List를 필드로서 생성한다. 
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    // 2. 어디에서든 쓸수있게  Static 필드로 logger 필드 만들기 (Logger객체는 내가 등록한 라이브러리에서 지원하는 객체이다.) 
    // LoggerFactory라는 객체에서 getLogger를 가져오는데 이때 넘기는 값이 클래스를 넘긴다 
    // 매개변수로 넘기는 클래스가 EchoHandler.class == (해당 클래스의 정보를 담은 class가 반환되는것) 넣는 것이다. 
    // vo객체처럼 하나를 만들어 찍어내는 형식처럼 지금 EchoHandler라는 클래스를 만들때 이 안에는 필드와 메소드들을 가지고 있게된다 (데이터와 행동) 모두 가지고 있는데  (ex: Member라는 틀)
    // 즉 이와같은것을 java에서 사용 되는 Class들에 대한 정의를하고있는 틀이!! Class.class이다 (즉 클래스 vo틀처럼 class틀을 가지고 있는것을 사용해서 매개변수로 넘기겠다는것이다.)
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    // 아래는 클라이언트가 연결 되었을 때 실행되는 메소드 인데 overriding한것이다.최상위 부모인 websocketHandler에 있는것을 구현 받아온것이다. 
    // 아래에서 클라이언트가 연결되면 !! WebSocketSession을 가지고 !  위에 선언한 필드에 담는다. 
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);// 필드에 담기 
        //logger.info("{} 연결됨", session.getId()); 
        // 이름과 직급 을 가지고 해결 
        String memName = ((Member)(session.getAttributes().get("loginUser"))).getMemName();
        String memRank = ((Member)(session.getAttributes().get("loginUser"))).getRank();
        String memNameAndRank = memName + " " + memRank;
        logger.info("{} 연결됨", memNameAndRank); 
        // httpSession에 담긴값도 뽑아오기 위해서 Servlet-context수정해줬다. 
        //System.out.println("session.getId()로 뽑은값 :" + session.getId()); // 랜덤값이 나온다. 랜덤하게 id같은게 부여되는 형식이다.
    }
    
    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행하는 메소드이다. (뭔짓을 해도 오직 한곳에서만 전송을 할수가 있다. 즉 여기서 어떡해서든 값을 뽑아와야하는데 )
    // DB에 insert시키고자 할떄 ! 
    // 넣어야할값들은 
    // 채팅기록번호(자동으로들어감), 사원번호(httpSession에서 뽑을수있음)
    // , 방번호 (얘가 문제다 !!! 화면단 쪽에서 ! 이를 쎄션에 담았다가 다른 방 들어가면 교체하는 식으로 해서 session에 담아줘야할듯하다.)
    // , 채팅내용은 그대로 들어갈것이다.
    // , 전송시간은 간단하게 그냥 sysdate로다가 db에 값을 넣을수는 있으나 이를 시간까지 가져오는데는 좀 한계성이 보인다. 
    // 시간까지 뽑아주는것은 없다 .
    
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 아래 변수들은 단지 웹소켓으로 상대방에게 보여질때 넘겨줄 나의 정보들 
    	String memName = ((Member)(session.getAttributes().get("loginUser"))).getMemName();
        String rank = ((Member)(session.getAttributes().get("loginUser"))).getRank();
        String checkPath = ((Member)(session.getAttributes().get("loginUser"))).getPath();
        String path = "resources/images/basicProfile.png";
        if(checkPath != null) {path = checkPath;}
        String nameAndRank = memName + " " + rank;
        String[] extractRoomNo = message.getPayload().split(",",2);
        int roomNo = Integer.parseInt(extractRoomNo[0]);
        
        // 아래 변수들은 db적재용 변수임
        int memNo = ((Member)(session.getAttributes().get("loginUser"))).getMemNo(); // 얘는 채팅 보여질때도 정채성을 나타내기 위해서 쓰임 
        
        //logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload()); // 여기서 {}얘는 SQL에 홀더같은 느낌이다. 
        
        // 굳이 콘솔에 남길필요는 없어짐 
        //logger.info("{}로 부터 서버로 메시지 → {} 받음", memName, getFullDate() + message.getPayload()); // 여기서 {}얘는 SQL에 홀더같은 느낌이다. 
        // logger는 말그대로 log를 남기기위한 것으로 pinrtln메소드마냥 console에 찍어준다. 

        //System.out.println(message.getPayload());// 얘가 쪽지 내용이다. 
        
        // 얘가 중요하다!  모든 유저에게 메세지 출력을 해주는것이다.  구분자를 통해서 3개를 넘겨야한다. 보낸 사람의 이름과, path, 시간을 넘겨줘야한다. 
        for(WebSocketSession sess : sessionList){
        	//((Member)sess.getAttributes().get("loginUser")).get
        	// ,를 구분자로 사용할것이다. 문제는 없는데 뿌리지기전에 낚아채서 작업을 할것이기에 내가 원하는 형식으로 뽑으면 된다. 
            sess.sendMessage(new TextMessage(roomNo
            								 + ","  
            								 + memNo
            								 + ","
            								 + path
            								 + ","
            		                         + nameAndRank
            		                         + "," 
            		                         + getTime()
            		                         + ","
            		                         + extractRoomNo[1]
            		          )); // 새로이 메세지 생성해서 나머지 유저들한테 뿌려주겠다 라는것이다. 
        }
        // 만약 여기서 읽음처리를 하고자 한다면 !!! 접속하는 시점이랑 나가는 시점을 !!! 채팅방 나갈때를 기준으로 잡아줘야한다!!! 
        
        
        // 아래가 선생님이 요청하신 메세지 insert시키는 메소드 호출이다. 
        //chatController.insertChatContent(memNo , roomNo, message.getPayload());
        
    }    

    //클라이언트 연결을 끊었을 때 실행 
    // 아래의 메소드가 실행될때 !!! Controller 호출해서 ! chatting쪽에서 ! 마지막으로 읽은 메세지에대한 번호 가져와서 기록을 해줘야한다! 
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String memName = ((Member)(session.getAttributes().get("loginUser"))).getMemName();
        String memRank = ((Member)(session.getAttributes().get("loginUser"))).getRank();
        String memNameAndRank = memName + " " + memRank;

        sessionList.remove(session);
        //logger.info("{} 연결 끊김.(채팅방 나감)", session.getId());
        logger.info("{} 연결 끊김.(채팅방 나감)", getFullDate() + memNameAndRank);
        
       //System.out.println("채팅방 퇴장자 : " + session.getPrincipal().getName());
    }
    
    // 콘솔용 시간 뽑아서 넣는 형식 
    static String getFullDate() {
    	SimpleDateFormat sdf = new SimpleDateFormat("[yy년 MM월 dd일  hh:mm:ss]");
    	return sdf.format(new Date());
    }

    static String getTime() {
    	SimpleDateFormat sdf = new SimpleDateFormat("aa hh:mm");
    	return sdf.format(new Date());
    }

    
}
