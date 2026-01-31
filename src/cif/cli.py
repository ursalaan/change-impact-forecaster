import json
import sys
from pathlib import Path

from .engine import assess_change
from .models import ChangeInput


def main():
    if len(sys.argv) != 3 or sys.argv[1] != "assess":
        print("Usage: python -m cif assess <change.json>")
        sys.exit(1)

    path = Path(sys.argv[2])

    with path.open() as f:
        payload = json.load(f)

    change = ChangeInput(**payload)
    result = assess_change(change)

    print(json.dumps(result.model_dump(), indent=2))


if __name__ == "__main__":
    main()