import React, {useState} from "react";

export default ({onLogin}) => {
    cons [phone,setPhone] = useState('')
    const onchange = (e) =>
        setPhone(e.target.vaule)

    const login = userType =>()=> 
        fetch('/api/authenticate', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                phone: phone,
                type: userType
            })
        
        }).then(res => res.json())
          .then(user => onLogin(user))

        return (
            <div> 
                <p> Welcome</p>
                <input 
                  type="text"
                  placeholedr="Phone number"
                  value={phone}
                  onChange={onchange}
                />

                <button onClick={login('driver')}>Login as driver</button>
                <button onClick={login('rider')}>login as rider</button>
            </div>
        )
}