import { Link } from "react-router-dom";
import { HashLink } from 'react-router-hash-link';
import { slide as Menu } from 'react-burger-menu';
import { useEffect, useState } from 'react';

import './header.css';

const MOBILE_SIZE = 523;

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
  
    return (
        <div className="header">
            {isMobile &&
                <Menu 
                    onStateChange={(state) => handleStateChange(state)}
                    isOpen={menuOpen} className="mobile-header"
                >
                    <Link onClick={() => closeMenu()} to="/">Home</Link>
                    <Link onClick={() => closeMenu()} to="/about">About</Link>
                </Menu>
            }
            <h1 className="header-heading">Capstone: Datachamps</h1>
            {!isMobile &&
                <div className="header-menu">
                    <Link className="header-link" to="/">Home</Link>
                    <Link className="header-link" to="/about">About</Link>
                </div>
            }
        </div>

    )
}

export default Header;