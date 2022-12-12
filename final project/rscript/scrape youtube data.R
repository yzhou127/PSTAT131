getVideos <- function(vid=NULL,part="snippet",mostPopular=FALSE,myRating=FALSE,maxResults=5,
                      pageToken=NULL,regionCode=NULL,videoCategoryId=NULL,
                      api_key){
  require(jsonlite)
  
  url.base=paste0("https://www.googleapis.com/youtube/v3/videos?")
  
  if(!(is.null(vid)==TRUE)){
    url.id<-paste0("&id=",vid)
  }
  if(!(is.null(api_key)==TRUE)){
    url<-paste0()
  }
  if(!(is.null(part)==TRUE)){
    # snippet,contentDetails,statistics,status
    url.part<-paste0("&part=",part)
  }
  if(!(is.null()==TRUE)){
    url.<-paste0()
  }
  if(mostPopular == TRUE){
    url.or<-paste0("&order=mostPopular")
  }
  if(myRating==TRUE){
    url.mr<-paste0("&myrating=TRUE")
  }
  if(!(is.null(maxResults)==TRUE)){
    url.max<-paste0("&maxResults=",maxResults)
  }
  if(!(is.null(oBCOwner)==TRUE)){
    url.obc<-paste0("&onBehalfOfContentOwner=",oBCOwner)
  }
  if(!(is.null(pageToken)==TRUE)){
    url.pt<-paste0("&pageToken=",pageToken)}
  
  if(!(is.null(regionCode)==TRUE)){
    url.rgc<-paste0("&regionCode=",regionCode)
  }
  if(!(is.null(videoCategoryId)==TRUE)){
    url.vcid<-paste0("&videoCategoryId=",videoCategoryId)
  }
  
  url<-paste0(url.base,"&key=",api_key)
  tmp.data <- readLines(url, warn="F",encoding = "UTF-8")
  tmp  <- jsonlite::fromJSON(tmp.data)
  VideoId <- tmp$items$id
  snippet<-getSnippet(tmp)
  contentDetails <- getContentDetails(tmp)
  statistics <- getStatistics(tmp)
  df<-as.data.frame(cbind(Vid,snippet,contentDetails,statistics))
  return(df)
}

getVideos(vid=jYSlpC6Ud2A,api_key=AIzaSyAKVDUpDfcFCO3r09S9Afn-dugJDS1XWhw)
