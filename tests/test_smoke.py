"""Smoke test for petshop."""

from petshop import __version__


def test_version_is_non_empty_string() -> None:
    assert isinstance(__version__, str)
    assert __version__
