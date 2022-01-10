
package main
import (
    "fmt"
	"log"
	"net/http"
    // "reflect"
    // "database/sql"
     "io/ioutil"
    "encoding/json"
    // "strings"
    // "strconv"

	"github.com/gorilla/mux"
    // "github.com/jinzhu/gorm"
    // "github.com/go-sql-driver/mysql"
)


func main() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", homeLink)
    router.HandleFunc("/spot", createspotList).Methods("POST")
    // router.HandleFunc("/spot/{id}", createspotView).Methods("POST")
     router.HandleFunc("/spots/{id}", getOnespot).Methods("GET")
    router.HandleFunc("/spots", getAllspots).Methods("GET")
    
    // router.HandleFunc("/spots/{id}", updatespot).Methods("PATCH")
    // router.HandleFunc("/spots/{id}", deletespot).Methods("DELETE")
	log.Fatal(http.ListenAndServe(":8080", router))
    
    
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse and unparse this JSON data, add this code to your project and do:
//
//    spotsData, err := UnmarshalSpotsData(bytes)
//    bytes, err = spotsData.Marshal()



func UnmarshalSpotsData(data []byte) (SpotsData, error) {
	var r SpotsData
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *SpotsData) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type SpotsData struct {
	Records []Record `json:"records"`
}

type Record struct {
	ID          string `json:"id"`         
	Fields      Fields `json:"fields"`
}

type Fields struct {
	SurfBreak               []string `json:"Surf Break, omitempty"`               
	DifficultyLevel         int64    `json:"Difficulty Level, omitempty"`         
	Destination             string   `json:"Destination, omitempty"`              
	// Geocode                 string   `json:"Geocode"`                  
	// Influencers             []string `json:"Influencers"`              
	// MagicSeaweedLink        string   `json:"Magic Seaweed Link"`       
	Photos                  []Photo  `json:"Photos, omitempty"`                   
	// PeakSurfSeasonBegins    string   `json:"Peak Surf Season Begins"`  
	DestinationStateCountry string   `json:"Destination State/Country, omitempty"`
	// PeakSurfSeasonEnds      string   `json:"Peak Surf Season Ends"`    
	// Address                 string   `json:"Address"`                  
}

type Photo struct {
	// ID         string     `json:"id"`        
	URL        string     `json:"url"`       
	// Filename   string     `json:"filename"`  
	// Size       int64      `json:"size"`      
	// Type       string     `json:"type"`      
	// Thumbnails Thumbnails `json:"thumbnails"`
}

// type Thumbnails struct {
// 	Small Full `json:"small"`
// 	Large Full `json:"large"`
// 	Full  Full `json:"full"` 
// }

// type Full struct {
// 	URL    string `json:"url"`   
// 	Width  int64  `json:"width"` 
// 	Height int64  `json:"height"`
// }
type allspots []SpotsData

// var spots = []byte(`
	
// 	{
// 		"records": [
// 			{
// 				"id": "1",
// 				"fields": {
// 					"Surf Break": [
// 						"Reef Break"
// 					],
// 					"Difficulty Level": 4,
// 					"Destination": "pipeline street",
// 					"Geocode": "🔵 eyJpIjoiUGlwZWxpbmUsIE9haHUsIEhhd2FpaSIsIm8iOnsic3RhdHVzIjoiT0siLCJmb3JtYXR0ZWRBZGRyZXNzIjoiRWh1a2FpIEJlYWNoIFBhcmssIEhhbGVpd2EsIEhJIDk2NzEyLCBVbml...",
// 					"Influencers": [
// 						"recD1zp1pQYc8O7l2",
// 						"rec1ptbRPxhS8rRun"
// 					],
// 					"Magic Seaweed Link": "https://magicseaweed.com/Pipeline-Backdoor-Surf-Report/616/",
// 					"Photos": [
// 						{
// 							"id": "attf6yu03NAtCuv5L",
// 							"url": "https://dl.airtable.com/ZuXJZ2NnTF40kCdBfTld_thomas-ashlock-64485-unsplash.jpg",
// 							"filename": "thomas-ashlock-64485-unsplash.jpg",
// 							"size": 688397,
// 							"type": "image/jpeg",
// 							"thumbnails": {
// 								"small": {
// 									"url": "https://dl.airtable.com/yfKxR9ZQqiT7drKxpjdF_small_thomas-ashlock-64485-unsplash.jpg",
// 									"width": 52,
// 									"height": 36
// 								},
// 								"large": {
// 									"url": "https://dl.airtable.com/cFfMuU8NQjaEskeC3B2h_large_thomas-ashlock-64485-unsplash.jpg",
// 									"width": 744,
// 									"height": 512
// 								},
// 								"full": {
// 									"url": "https://dl.airtable.com/psynuQNmSvOTe3BWa0Fw_full_thomas-ashlock-64485-unsplash.jpg",
// 									"width": 2233,
// 									"height": 1536
// 								}
// 							}
// 						}
// 					],
// 					"Peak Surf Season Begins": "2018-07-22",
// 					"Destination State/Country": "Oahu, Hawaii",
// 					"Peak Surf Season Ends": "2018-08-31",
// 					"Address": "Pipeline, Oahu, Hawaii"
// 				},
// 				"createdTime": "2018-05-31T00:16:16.000Z"
// 			},
// 			{
// 				"id": "2",
// 				"fields": {
// 					"Surf Break": [
// 						"Point Break"
// 					],
// 					"Difficulty Level": 5,
// 					"Destination": "Walvis Bay",
// 					"Geocode": "🔵 eyJpIjoiU2tlbGV0b24gQmF5LCBOYW1pYmlhIiwibyI6eyJzdGF0dXMiOiJPSyIsImZvcm1hdHRlZEFkZHJlc3MiOiJOYW1pYmlhIiwibGF0IjotMjUuOTE0NDkxOSwibG5nIjoxNC45MDY4NTk...",
// 					"Influencers": [
// 						"recD1zp1pQYc8O7l2",
// 						"rec1ptbRPxhS8rRun"
// 					],
// 					"Magic Seaweed Link": "https://magicseaweed.com/Skeleton-Bay-Surf-Report/4591/",
// 					"Photos": [
// 						{
// 							"id": "attKinKKZvgdS5A5U",
// 							"url": "https://dl.airtable.com/YzqA020RRLaTyAZAta9g_brandon-compagne-308937-unsplash.jpg",
// 							"filename": "brandon-compagne-308937-unsplash.jpg",
// 							"size": 1494974,
// 							"type": "image/jpeg",
// 							"thumbnails": {
// 								"small": {
// 									"url": "https://dl.airtable.com/Y8970kyrQHWfL6AMkxZQ_small_brandon-compagne-308937-unsplash.jpg",
// 									"width": 54,
// 									"height": 36
// 								},
// 								"large": {
// 									"url": "https://dl.airtable.com/dkQKXoUnTGiofIvg5TJR_large_brandon-compagne-308937-unsplash.jpg",
// 									"width": 768,
// 									"height": 512
// 								},
// 								"full": {
// 									"url": "https://dl.airtable.com/pexuxaQ6D2VV61pyhUwn_full_brandon-compagne-308937-unsplash.jpg",
// 									"width": 3000,
// 									"height": 2000
// 								}
// 							}
// 						}
// 					],
// 					"Peak Surf Season Begins": "2018-09-01",
// 					"Destination State/Country": "Namibia",
// 					"Peak Surf Season Ends": "2018-11-30",
// 					"Address": "Skeleton Bay, Namibia "
// 				},
// 				"createdTime": "2018-05-31T00:16:16.000Z"
// 			},
// 			{
// 				"id": "3",
// 				"fields": {
// 					"Surf Break": [
// 						"Point Break"
// 					],
// 					"Difficulty Level": 2,
// 					"Destination": "Tweed Heads",
// 					"Geocode": "🔵 eyJpIjoiU3VwZXJiYW5rLCBHb2xkIENvYXN0LCBBdXN0cmFsaWEiLCJvIjp7InN0YXR1cyI6Ik9LIiwiZm9ybWF0dGVkQWRkcmVzcyI6IlNuYXBwZXIgUm9ja3MgUmQsIENvb2xhbmdhdHRhIFF...",
// 					"Influencers": [
// 						"recSkJ4HuvzAUBrdd"
// 					],
// 					"Magic Seaweed Link": "https://magicseaweed.com/Surfers-Paradise-Gold-Coast-Surf-Report/1012/",
// 					"Photos": [
// 						{
// 							"id": "attmtbEOAQteRjz2p",
// 							"url": "https://dl.airtable.com/I4E4xZeQbO2g814udQDm_jeremy-bishop-80371-unsplash.jpg",
// 							"filename": "jeremy-bishop-80371-unsplash.jpg",
// 							"size": 1524876,
// 							"type": "image/jpeg",
// 							"thumbnails": {
// 								"small": {
// 									"url": "https://dl.airtable.com/IWP9RPvvSM2pX1sHeigV_small_jeremy-bishop-80371-unsplash.jpg",
// 									"width": 48,
// 									"height": 36
// 								},
// 								"large": {
// 									"url": "https://dl.airtable.com/aBnINo8qQqDvER2f2wGg_large_jeremy-bishop-80371-unsplash.jpg",
// 									"width": 683,
// 									"height": 512
// 								},
// 								"full": {
// 									"url": "https://dl.airtable.com/eZxgLD8hRI2Y27J39LNl_full_jeremy-bishop-80371-unsplash.jpg",
// 									"width": 3000,
// 									"height": 2250
// 								}
// 							}
// 						}
// 					],
// 					"Peak Surf Season Begins": "2018-11-28",
// 					"Destination State/Country": "Gold Coast, Australia",
// 					"Peak Surf Season Ends": "2019-02-01",
// 					"Address": "Superbank, Gold Coast, Australia"
// 				},
// 				"createdTime": "2018-05-31T00:16:16.000Z"
// 			}
// 		],
// 		"offset": "recH2ennHFNOtB1Wt"
// 	}
// `)

func homeLink(w http.ResponseWriter, r *http.Request) {
	
 }

//fmt.Fprintf(spots)


var spots = []byte(`
    {
    		"records": [
    			{
    				"id": "1",
    				"fields": {
    					"Surf Break": [
    						"Reef Break"
    					],
    					"Destination State/Country": "Oahu, Hawaii"
    				}
                },
    			{
    				"id": "2",
    				"fields": {
    					"Surf Break": [
    						"Point Break"
    					],
    					"Destination State/Country": "Namibia"
    			}
                },
    			{
    				"id": "3",
    				"fields": {
    					"Surf Break": [
    						"Point Break"
    					],
    					"Destination State/Country": "Gold Coast, Australia"
    			    }
                }
    		]
    }`)

var detailSpot = []byte(`
{
    "records": [
        {
            "id": "1",
            "fields": {
                "Surf Break": [
                    "Reef Break"
                ],
                "Difficulty Level": 4,
					"Destination": "pipeline street",
					"Photos": [
						{
                            "id":"a",
							"url": "https://dl.airtable.com/ZuXJZ2NnTF40kCdBfTld_thomas-ashlock-64485-unsplash.jpg"
						}
					],
                "Destination State/Country": "Oahu, Hawaii"
            }
        },
        {
            "id": "2",
            "fields": {
                "Surf Break": [
                    "Point Break"
                ],
                "Difficulty Level": 5,
					"Destination": "Walvis Bay",
					"Photos": [
						{
                            "id":"b",
							"url": "https://dl.airtable.com/YzqA020RRLaTyAZAta9g_brandon-compagne-308937-unsplash.jpg"
						}
					],
                "Destination State/Country": "Namibia"
        }
        },
        {
            "id": "3",
            "fields": {
                "Surf Break": [
                    "Point Break"
                ],
                "Difficulty Level": 2,
					"Destination": "Tweed Heads",
					"Photos": [
						{
                            "id":"c",
							"url": "https://dl.airtable.com/I4E4xZeQbO2g814udQDm_jeremy-bishop-80371-unsplash.jpg"
						}
					],
                "Destination State/Country": "Gold Coast, Australia"
            }
        }
    ]
}`)
func getOnespot(w http.ResponseWriter, r *http.Request) {
	spotID := mux.Vars(r)["id"]
    // spotID, err := strconv.Atoi(spotIDS)
    // fmt.Print(spotID)

    rawIn := json.RawMessage(detailSpot)
    bytes, err := rawIn.MarshalJSON()
    if err != nil {
        panic(err)
    }
    var p SpotsData
    err = json.Unmarshal(bytes, &p)
    if err != nil {
        panic(err)
    }

    // fmt.Printf("%+v", p.Records[2].Fields.DifficultyLevel)

    // allSpots:=string(spots)
    // //  bs, _ := json.Marshal(allSpots)
    // fmt.Print()
    
	for _, singlespot := range p.Records {
        // oneSpot:=string(singlespot)
		if singlespot.ID == spotID {
        // fmt.Fprintf(w, oneSpot)
        
		json.NewEncoder(w).Encode(singlespot)
		}
	}
}

func getAllspots(w http.ResponseWriter, r *http.Request) {
	//json.NewEncoder(w).Encode(spots)
    // c, err := json.Marshal(spots)$

    // allSpots:=string(spots)
    // fmt.Fprintf(w, allSpots)
    //spotID := mux.Vars(r)["id"]

    // rawIn := json.RawMessage(spots)
    // bytes, err := rawIn.MarshalJSON()
    // if err != nil {
    //     panic(err)
    // }
    // var p SpotsData
    // err = json.Unmarshal(bytes, &p)
    // if err != nil {
    //     panic(err)
    // }

    allSpots:=string(spots)
    fmt.Fprintf(w, allSpots)

    // in := []byte(`{}`)
    //     var raw map[string]interface{}
    //     json.Unmarshal(in, &raw)

    //     var spotsArray []string
    // for _, singlespot := range p.Records {
    //     ListSurfBreak:=singlespot.Fields.SurfBreak[0]
    //     spotID:=singlespot.ID
    //     ListDestinationStateCountry:=singlespot.Fields.DestinationStateCountry
        
        
    //     raw["DestinationStateCountry"] = ListDestinationStateCountry
    //     raw["Surf Break"] = ListSurfBreak
    //     raw["id"] = spotID
    //     out, _ := json.Marshal(raw)
    //     // str := []string{"Geeks", "For", "Geeks"}
    //     // fmt.Println(reflect.TypeOf(out))
        
    //     out2 := string(out)
    //     // fmt.Println(reflect.TypeOf(out2))

    //     spotsArray=append(spotsArray, out2)
        
    //     // println(string(out))
    //     // json.NewEncoder(w).Encode(string(out))
    //     // spotsList:= ListDestinationStateCountry+ " " + ListSurfBreak
    //     //  fmt.Printf("%v %v", ListDestinationStateCountry, ListSurfBreak)
	// 		// json.NewEncoder(w).Encode(spotsList)
	// }
    //     joinedJson := strings.Join(spotsArray, ",")
    //     joinedJson = "{\"records\":[" + joinedJson + "]}"
    //     fmt.Fprintf(w, "%v", joinedJson)
    // ListSurfBreak:=p.Records[0].Fields.SurfBreak[0]
    // ListDestinationStateCountry:=p.Records[0].Fields.DestinationStateCountry
    // fmt.Fprintf(w, "%v %v", ListDestinationStateCountry, ListSurfBreak)
    // fmt.Fprintf(w, ListSurfBreak)
    

    // type Record struct {      
    //     Fields      Fields `json:"fields"`
    // }
    
    // type Fields struct {
    //     SurfBreak               []string `json:"Surf Break"`                 
    //     DestinationStateCountry string   `json:"Destination State/Country"`                
    // }
}


// type Record struct {
// 	ID          string `json:"id"`         
// 	Fields      Fields `json:"fields"`
// }
// type Fields struct {
// 	SurfBreak               []string `json:"Surf Break, omitempty"`               
// 	DifficultyLevel         int64    `json:"Difficulty Level, omitempty"`         
// 	Destination             string   `json:"Destination, omitempty"`              
// 	// Geocode                 string   `json:"Geocode"`                  
// 	// Influencers             []string `json:"Influencers"`              
// 	// MagicSeaweedLink        string   `json:"Magic Seaweed Link"`       
// 	Photos                  []Photo  `json:"Photos, omitempty"`                   
// 	// PeakSurfSeasonBegins    string   `json:"Peak Surf Season Begins"`  
// 	DestinationStateCountry string   `json:"Destination State/Country, omitempty"`
// 	// PeakSurfSeasonEnds      string   `json:"Peak Surf Season Ends"`    
// 	// Address                 string   `json:"Address"`                  
// }

var newSpotPost = allspots{
    SpotsData{ 
        Records: []Record{ 
            Record{
                ID: "4",
                Fields: Fields{
                    SurfBreak : []string{"X break"},
                    DifficultyLevel : 10,
                    Destination : "Dakhla",
                },
            }, 
        }, 
    },
}



//         "records": [
//         {
//             ID: "4",
//             fields: {
//                 Surf Break: [
//                     "Reef Break"
//                 ],
//                 Difficulty Level: 4,
// 					Destination: "pipeline street",
// 					Photos: [
// 						{
//                             id:"a",
// 							url: "https://dl.airtable.com/ZuXJZ2NnTF40kCdBfTld_thomas-ashlock-64485-unsplash.jpg"
// 						},
// 					],
//                 Destination State/Country: "Oahu, Hawaii"
//             }
//         },
//         ]
//     },  
// }




func createspotList(w http.ResponseWriter, r *http.Request) {
	var newspot SpotsData
	reqBody, err := ioutil.ReadAll(r.Body)
	if err != nil {
		fmt.Fprintf(w, "Kindly enter data with the spot title and description only in order to update")
	}
	
	json.Unmarshal(reqBody, &newspot)
	newSpotPost = append(newSpotPost, newspot)
	w.WriteHeader(http.StatusCreated)

	json.NewEncoder(w).Encode(newSpotPost)
    
}
// func createspotView(w http.ResponseWriter, r *http.Request) {
//         var newspot SpotsData
//         reqBody, err := ioutil.ReadAll(r.Body)
//         if err != nil {
//             fmt.Fprintf(w, "Kindly enter data with the spot title and description only in order to update")
//         }
        
//         json.Unmarshal(reqBody, &newspot)
//         spots = append(spots, newspot)
//         w.WriteHeader(http.StatusCreated)
    
//         json.NewEncoder(w).Encode(newspot)
        
// }

// func updatespot(w http.ResponseWriter, r *http.Request) {
// 	spotID := mux.Vars(r)["id"]
// 	var updatedspot spot

// 	reqBody, err := ioutil.ReadAll(r.Body)
// 	if err != nil {
// 		fmt.Fprintf(w, "Kindly enter data with the spot title and description only in order to update")
// 	}
// 	json.Unmarshal(reqBody, &updatedspot)

// 	for i, singlespot := range spots {
// 		if singlespot.ID == spotID {
// 			singlespot.Title = updatedspot.Title
// 			singlespot.Description = updatedspot.Description
// 			spots = append(spots[:i], singlespot)
// 			json.NewEncoder(w).Encode(singlespot)
// 		}
// 	}
// }

// func deletespot(w http.ResponseWriter, r *http.Request) {
// 	spotID := mux.Vars(r)["id"]

// 	for i, singlespot := range spots {
// 		if singlespot.ID == spotID {
// 			spots = append(spots[:i], spots[i+1:]...)
// 			fmt.Fprintf(w, "The spot with ID %v has been deleted successfully", spotID)
// 		}
// 	}
// }
