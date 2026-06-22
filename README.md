# 🎬 Netflix Content Analysis — SQL Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-orange?style=for-the-badge)

## 📖 Overview

This project explores the Netflix content library using **PostgreSQL** to answer 15 real-world business questions. The analysis covers content distribution, ratings, genres, directors, cast members, and more — showcasing practical SQL skills including CTEs, window functions, aggregations, and conditional logic.

---

## 🗃️ Dataset

The dataset used is the publicly available **Netflix Movies and TV Shows** dataset, stored in a table called `netflix`.

| Column | Description |
|---|---|
| `show_id` | Unique identifier for each title |
| `type` | Movie or TV Show |
| `title` | Name of the content |
| `director` | Director(s) of the content |
| `casts` | Cast members |
| `country` | Country of production |
| `date_added` | Date added to Netflix |
| `release_year` | Year of release |
| `rating` | Content rating (e.g., PG-13, TV-MA) |
| `duration` | Duration (minutes for movies, seasons for TV shows) |
| `listed_in` | Genre/category |
| `description` | Brief description of the content |

---

##  Business Problems Solved

| # | Question |
|---|---|
| 1 | Count the number of Movies vs TV Shows |
| 2 | Find the most common rating for Movies and TV Shows |
| 3 | List all movies released in a specific year (e.g., 2020) |
| 4 | Identify the longest movie |
| 5 | Find all Movies/TV Shows by director **Rajiv Chilaka** |
| 6 | List all TV Shows with more than 5 seasons |
| 7 | List all movies that are documentaries |
| 8 | Find all content without a director |
| 9 | Find how many movies actor **Salman Khan** appeared in over the last 10 years |
| 10 | Find the top 5 years with the highest number of content releases |
| 11 | Count titles categorized under "International" content |
| 12 | Find all titles containing the word "Love" |
| 13 | Find the 10 oldest Movies or TV Shows |
| 14 | Which countries produce more TV Shows than Movies? |
| 15 | Categorize content as 'Bad' (contains "kill"/"violence") or 'Good' and count each |



##  Sample Insights

- **Most content** on Netflix tends to be Movies rather than TV Shows.
- The **most common ratings** differ between Movies and TV Shows, reflecting different audience targets.
- A significant portion of Netflix content is tagged as **International**, reflecting the platform's global reach.
- Countries like **South Korea and Japan** often produce more TV Shows than Movies on Netflix.
- Content with keywords like **"kill"** or **"violence"** in descriptions can be flagged for audience filtering.

---

## Contributing

Contributions and improvements are welcome! Feel free to fork the repo, add new queries, and open a pull request.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
