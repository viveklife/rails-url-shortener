**List All Short Url**
----
  Returns array json data urls.

* **URL**

  /urls.json

* **Method:**

  `GET`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[{"id":1,"original_url":"dsfds.com","created_at":"2018-09-19T10:37:39.992Z","updated_at":"2018-09-19T10:37:39.992Z","short_url":"http://localhost:3000/FxnvWdxDs7a6lwLe","url":"http://localhost:3000/urls/FxnvWdxDs7a6lwLe.json"}]`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/urls",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```