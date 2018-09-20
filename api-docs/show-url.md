----
  Returns json data about a single url.

* **URL**

  /urls/:short_url

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `short_url=[string]`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{"id":1,"original_url":"google.com","created_at":"2018-09-19T10:37:39.992Z","updated_at":"2018-09-19T10:37:39.992Z","short_url":"http://localhost:3000/FxnvWdxDs7a6lwLe","url":"http://localhost:3000/urls/FxnvWdxDs7a6lwLe.json"}`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Url doesn't exist" }`


* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/urls/:short_url",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```