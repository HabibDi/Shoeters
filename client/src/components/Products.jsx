import { useState, useEffect } from 'react'

export default function Products() {

    const [products, setProducts] = useState([])

    const fetchData = () => {
        return fetch("http://localhost:5000/products")
            .then((response) => response.json())
            .then((data) => setProducts(data))
    }

    useEffect(() => {
        fetchData()
    }, [])

    return (
        <ul>{products.map(item => <li>{item.product_name}</li>)}</ul>
    )
}
