import pytest
from dundie.core import load
from .constants import PEOPLE_FILE


@pytest.mark.unit
@pytest.mark.high
def test_load_postive_has_3_people():
    """Test load function."""
    assert len(load(PEOPLE_FILE)) == 3


@pytest.mark.unit
@pytest.mark.high
def test_load_postive_first_name_starts_with_j():
    """Test load function."""
    assert load(PEOPLE_FILE)[0][0] == "J"
