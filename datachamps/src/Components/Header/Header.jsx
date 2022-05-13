import { Link } from "react-router-dom";
import { HashLink } from 'react-router-hash-link';
import { slide as Menu } from 'react-burger-menu';
import { useEffect, useState } from 'react';

import './header.css';

const MOBILE_SIZE = 720;

const Header = () => {
    const [isMobile, setIsMobile] = useState(window.innerWidth <= MOBILE_SIZE);
    const [menuOpen, setMenuOpen] = useState(false);

    useEffect(() => {
        window.addEventListener('resize', () => {
            setIsMobile(window.innerWidth <= MOBILE_SIZE);
            console.log(window.innerWidth);
        })
    }, [isMobile]);

    const handleStateChange = state => setMenuOpen(state.isOpen);
    const closeMenu = () => setMenuOpen(false);
    const style = {"font-size": "14px", "letter-spacing": "unset"}
  
    return (
        <div className="header">
            {/* {!isMobile &&
                <div className="header-menu">
                    <Link className="header-link" to="/">Home</Link>
                    <Link className="header-link" to="/about">About</Link>
                </div>
            } */}
            <h1 className="header-heading">Skillet Analytics</h1>
            <h2 className="header-heading" style={style}>Data that drives restaurant operations</h2>
            <div>
                <button className="button"><a href="https://skilletfood.com/" target="_blank">Dine at Skillet now!</a></button>
            </div>
            <div className="image-layover"/>
            {/* <img className="image" src="img/skillet.jpg" alt="Skillet logo" /> */}
            {/* {isMobile &&
                <div className="mobile-header">
                    <Menu right
                        onStateChange={(state) => handleStateChange(state)}
                        isOpen={menuOpen} pageWrapId="mobile-wrap" overlayClassName="mobile-overlay" menuClassName="mobile-menu"
                    >
                        <Link onClick={() => closeMenu()} to="/">Home</Link>
                        <Link onClick={() => closeMenu()} to="/about">About</Link>
                    </Menu>
                </div>
            } */}
        </div>

    )
}

export default Header;