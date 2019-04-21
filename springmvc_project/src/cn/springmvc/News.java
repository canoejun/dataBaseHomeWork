package cn.springmvc;

public class News {
	private String title;
	private String media;
	private String time;
	private String url;
	private String pictureUrl;

	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public void setMedia(String media) {
		this.media = media;
	}
	public String getMedia() {
		return media;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
}
