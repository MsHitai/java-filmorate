package ru.yandex.practicum.filmorate.service;

import org.springframework.stereotype.Service;
import ru.yandex.practicum.filmorate.model.Film;
import ru.yandex.practicum.filmorate.model.Genre;
import ru.yandex.practicum.filmorate.model.Rating;
import ru.yandex.practicum.filmorate.model.User;
import ru.yandex.practicum.filmorate.storage.film.FilmStorage;
import ru.yandex.practicum.filmorate.storage.user.UserStorage;

import java.util.Collection;
import java.util.List;

@Service
public class FilmService {
    private final FilmStorage filmStorage;

    private final UserStorage userStorage;

    public FilmService(FilmStorage filmStorage, UserStorage userStorage) {
        this.filmStorage = filmStorage;
        this.userStorage = userStorage;
    }

    public void addLike(int filmId, int userId) {
        Film film = findById(filmId);
        User user = userStorage.findById(userId);
        filmStorage.addLike(film.getId(), user.getId());
    }

    public List<Film> findPopularFilms(int size) {
        return filmStorage.findPopularFilms(size);
    }

    public void deleteLike(int filmId, int userId) {
        Film film = findById(filmId);
        User user = userStorage.findById(userId);
        filmStorage.deleteLike(film.getId(), user.getId());
    }

    public Film addFilm(Film film) {
        return filmStorage.addFilm(film);
    }

    public Film deleteFilm(int id) {
        return filmStorage.deleteFilm(id);
    }

    public Film updateFilm(Film film) {
        return filmStorage.updateFilm(film);
    }

    public Collection<Film> findAll() {
        return filmStorage.findAll();
    }

    public Film findById(int id) {
        return filmStorage.findById(id);
    }

    public List<Genre> findAllGenres() {
        return filmStorage.findAllGenres();
    }


    public Genre findGenreById(int id) {
        return filmStorage.findGenreById(id);
    }

    public List<Rating> findAllRatings() {
        return filmStorage.findAllRatings();
    }

    public Rating findRatingById(int id) {
        return filmStorage.findRatingById(id);
    }
}
