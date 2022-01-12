
package main
import (
    // "fmt"
	"log"
    "strings"
	"net/http"
    // "reflect"
    "database/sql"
    // "io/ioutil"
    "encoding/json"
    // "strings"
    // "strconv" 
    // "database/sql"
	"github.com/gorilla/mux"
    // "github.com/jinzhu/gorm"
    _"github.com/go-sql-driver/mysql"
    // "github.com/LUSHDigital/scan"
)


type SpotsData struct {
	Records []Record `json:"records"`
}
type Record struct {
	ID          string `json:"id"`         
	Post      Post `json:"fields"`
}
type Post struct{
    SurfBreak               []string `json:"Surf Break"`               
	DifficultyLevel         int64    `json:"Difficulty Level"`         
	Destination             string   `json:"Destination"`              
	Photos                  []Photo  `json:"Photos"`                   
	DestinationStateCountry string   `json:"Destination State/Country"`

}
type Photo struct {
	Urlphoto        string     `json:"url"`       
}

var db *sql.DB
var err error

func main() {
    db, err = sql.Open("mysql", "root:apirestgo@tcp(127.0.0.1:3306)/surfspots?parseTime=true")
    if err != nil {
        panic(err.Error())
    }
    // defer db.Close()
	// router := mux.NewRouter().StrictSlash(true)
    router := mux.NewRouter()
	// router.HandleFunc("/", homeLink)
    // router.HandleFunc("/spot", createspotList).Methods("POST")
    // router.HandleFunc("/spot/{id}", createspotView).Methods("POST")
    // router.HandleFunc("/spots/{id}", getOnespot).Methods("GET")
    router.HandleFunc("/spots", getAllspots).Methods("GET")
    
    // router.HandleFunc("/spots/{id}", updatespot).Methods("PATCH")
    // router.HandleFunc("/spots/{id}", deletespot).Methods("DELETE")
	log.Fatal(http.ListenAndServe(":8080", router))
    
}




func getAllspots(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    var records []Record
    result, err := db.Query("SELECT id, surfbreak,  difficultylevel, destination, urlphoto, destinationstatecountry FROM spots")
    if err != nil {
        panic(err.Error())
    }
    defer result.Close()
    for result.Next() {
        var record Record
        var surfBreak string
        var urlphoto Photo
        err := result.Scan(&record.ID, &surfBreak, &record.Post.DifficultyLevel, &record.Post.Destination , &urlphoto.Urlphoto, &record.Post.DestinationStateCountry)
        convertSurfBreakToArray := strings.Split(surfBreak, ",")
        if err != nil {
        panic(err.Error())
        }
        record.Post.SurfBreak = convertSurfBreakToArray
        var picturesArray []Photo
        picturesArray = append(picturesArray, urlphoto)
        record.Post.Photos = picturesArray
        records = append(records, record)
    }
        var spotdata SpotsData
        spotdata.Records = records
    json.NewEncoder(w).Encode(spotdata)
}

