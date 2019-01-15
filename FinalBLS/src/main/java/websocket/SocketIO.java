package websocket;

import java.io.IOException;

import org.json.JSONObject;

import com.metamx.emitter.core.Emitter;
import com.metamx.emitter.core.Event;

import io.socket.client.IO;
import io.socket.emitter.Emitter.Listener;

public class SocketIO implements Emitter {
	private io.socket.client.Socket socket = null;
	public SocketIO() {
        // TODO Auto-generated constructor stub
        try {
            socket = IO.socket("http://localhost:8080");
            socket.connect();
            socket.on("subscribe", (Listener) this); //subscribe
            JSONObject jobj = new JSONObject();
            jobj.put("msg", "init");
            jobj.put("id", "jdh1");
            socket.emit("init",jobj);
        } catch (Exception e) {
        }
    }
	public void send(String id, String msg) throws Exception {
		try {
			JSONObject jobj = new JSONObject();
			jobj.put("msg", msg);
			jobj.put("id", id);
			socket.emit("publish", jobj);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void call(Object... arg0) {
		String msg = arg0[0].toString();
		System.out.println("받은내용:" + msg);

	}
	@Override
	public void start() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void emit(Event event) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void flush() throws IOException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void close() throws IOException {
		// TODO Auto-generated method stub
		
	}
}
