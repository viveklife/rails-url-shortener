----
  Returns json data about a created url.

* **URL**

  /urls.json

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
   `url => { original_url => [string] }`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
    "id": 6,
    "original_url": "abc.com",
    "created_at": "2018-09-20T13:49:15.169Z",
    "updated_at": "2018-09-20T13:49:15.169Z",
    "short_url": "http://localhost:3000/weqccua177",
    "url": "http://localhost:3000/urls/weqccua177.json"
}`
 
* **Error Response:**

  * **Code:** 422 Unprocessable Entity <br />
    **Content:** `{
    "original_url": [
        "invalid URL"
    ]
}`

  * **Code:** 422 Unprocessable Entity <br />
    **Content:** `{
    "original_url": [
        "already exists"
    ]
}`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/urls",
      dataType: "json",
      data: {url: {original_url: 'abc.com'}},
      type : "POST",
      success : function(r) {
        console.log(r);
      }
    });
  ```