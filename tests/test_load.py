import pytest
from dundie.core import load
from .constants import PEOPLE_FILE
EXPECTED_NAMES = ["Jim Halpert", "Dwight Schrute", "Gabe Lewis"]
EXPECTED_DEPTS = ["Sales", "Director"]
EXPECTED_ROLES = ["Salesman", "Manager"]
EMAIL_DOMAIN = "dundlermifflin.com"


@pytest.mark.unit
@pytest.mark.high
def test_load(request):
    """Test loaded data conforms with loaded file"""
    result = load(PEOPLE_FILE)  # load people.csv as a list of csv lines
    assert len(result) == 3
    for line in result:
        data = line.split(", ")
        assert data[0] in EXPECTED_NAMES
        assert data[1] in EXPECTED_DEPTS
        assert data[2] in EXPECTED_ROLES
        assert data[3].split("@")[1] in EMAIL_DOMAIN
