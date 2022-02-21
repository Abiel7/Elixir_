import { useState, useEffect } from "react";

export  const usePostion = () => {
    const [postion,setPostion] = useState()

    useEffect(()=>{
        const watch =  navigator.geolocation.getCurrentPosition(({ coords }) => setPostion({
            lat :coords.latitude,
            lng: coords.longitude
        })) 

        return () => navigator.geolocation.clearWatch(watch)
    },[])

    return postion
}