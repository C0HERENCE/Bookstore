﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStoreMisc
{
    public class BookStatModel
    {
        public int id = 0;
        public string title = "";
        public string category = "";
        public string author = "";
        public string publisher = "";
        public string isbn = "";
        public int stock = 0;
        public double price = 0;
        public int onsale = 0;
        public DateTime datetime;
        public double stars = 0;
        public string image = "";
        public string pubdate = "";
        public string pages = "";
        public string origin_price = "";
        public string summary = "";
        public string catalog = "";
        public string origintitle = "";
        public string subtitle = "";
        public int categoryrole = 0;
        public int author_id = 0;
        public int category_id = 0;
        public int publisher_id = 0;

        public BookStatModel()
        {
        }

        public BookStatModel(int id, string title, string category, string author, string publisher, string isbn, int stock, double price, int onsale, DateTime datetime, double stars, string image, string pubdate, string pages, string origin_price, string summary, string catalog, string origintitle, string subtitle, int categoryrole, int author_id, int category_id, int publisher_id)
        {
            this.id = id;
            this.title = title;
            this.category = category;
            this.author = author;
            this.publisher = publisher;
            this.isbn = isbn;
            this.stock = stock;
            this.price = price;
            this.onsale = onsale;
            this.datetime = datetime;
            this.stars = stars;
            this.image = image;
            this.pubdate = pubdate;
            this.pages = pages;
            this.origin_price = origin_price;
            this.summary = summary;
            this.catalog = catalog;
            this.origintitle = origintitle;
            this.subtitle = subtitle;
            this.categoryrole = categoryrole;
            this.author_id = author_id;
            this.category_id = category_id;
            this.publisher_id = publisher_id;
        }
    }


}